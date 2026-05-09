#!/usr/bin/env python3
"""Timeline check helpers for worldview.db.

Domain: factual timeline consistency — year/half, character availability,
event existence, cause/effect direction. POV/visibility checks are NOT
done here; use pov_check.py for those.

Usage:
  python3 worldview/db/queries/timeline_check.py --check-freshness
  python3 worldview/db/queries/timeline_check.py --year 2058 [--span 2]
  python3 worldview/db/queries/timeline_check.py --year 2058 --domain 政治
  python3 worldview/db/queries/timeline_check.py --character "李书记"
  python3 worldview/db/queries/timeline_check.py --character "李书记" --year 2058
  python3 worldview/db/queries/timeline_check.py --characters "李书记,Davidson" --year 2058
  python3 worldview/db/queries/timeline_check.py --resolve-fact "聚变美元"
  python3 worldview/db/queries/timeline_check.py --verify-fact 778 --year 2056 [--half 2]
  python3 worldview/db/queries/timeline_check.py --cause-of 778
  python3 worldview/db/queries/timeline_check.py --effects-of 6
  python3 worldview/db/queries/timeline_check.py --check-causal 6 52
  python3 worldview/db/queries/timeline_check.py --json ...

Exit: 0 has-data / 1 nothing-found / 2 error.
"""

import argparse
import sys

from _common import (
    check_freshness, get_character, resolve_fact, get_facts_by_id,
    window_scan, get_connection, emit,
)


def character_availability(name, year):
    """Born? Still alive? At given year."""
    matches = get_character(name)
    if not matches:
        return {"error": f"character not found: {name}"}
    if len(matches) > 1:
        return {"error": f"ambiguous: {name}", "candidates": matches}
    c = matches[0]
    issues = []
    if c.get("birth_year") is not None and year < c["birth_year"]:
        issues.append(f"not born yet ({c['birth_year']} > {year})")
    if c.get("death_year") is not None and year > c["death_year"]:
        issues.append(f"already dead ({c['death_year']} < {year})")
    return {"character": c, "year": year, "issues": issues, "available": not issues}


def bulk_availability(names, year):
    """Returns a flat list — one record per name — for clean tabular output."""
    records = []
    for n in names:
        rec = character_availability(n, year)
        if "error" in rec:
            records.append({"queried_name": n, "error": rec["error"]})
            continue
        c = rec["character"]
        records.append({
            "queried_name": n,
            "id": c["id"],
            "name": c["name"],
            "birth_year": c["birth_year"],
            "death_year": c["death_year"],
            "knowledge_tier": c["knowledge_tier"],
            "year": rec["year"],
            "available": rec["available"],
            "issues": "; ".join(rec["issues"]) if rec["issues"] else "",
        })
    return records


def domain_filter(year, domain, span=2):
    """Window scan filtered by domain."""
    conn = get_connection()
    cur = conn.execute(
        "SELECT id, year, half, domain, title, visibility_level, importance, "
        "is_watershed, is_time_anchor "
        "FROM facts WHERE year BETWEEN ? AND ? AND domain = ? "
        "ORDER BY year, half, importance DESC",
        (year - span, year + span, domain),
    )
    return [dict(r) for r in cur.fetchall()]


def cause_of(fact_id):
    """All facts that cause this one."""
    conn = get_connection()
    cur = conn.execute(
        "SELECT fc.cause_fact_id AS id, f.year, f.half, f.domain, f.title, "
        "fc.relationship_type, fc.notes "
        "FROM fact_causes fc JOIN facts f ON f.id = fc.cause_fact_id "
        "WHERE fc.effect_fact_id = ? "
        "ORDER BY f.year, f.half",
        (fact_id,),
    )
    return [dict(r) for r in cur.fetchall()]


def effects_of(fact_id):
    """All facts this one causes."""
    conn = get_connection()
    cur = conn.execute(
        "SELECT fc.effect_fact_id AS id, f.year, f.half, f.domain, f.title, "
        "fc.relationship_type, fc.notes "
        "FROM fact_causes fc JOIN facts f ON f.id = fc.effect_fact_id "
        "WHERE fc.cause_fact_id = ? "
        "ORDER BY f.year, f.half",
        (fact_id,),
    )
    return [dict(r) for r in cur.fetchall()]


def check_causal_direction(a_id, b_id):
    """Forward / reverse / none / both."""
    conn = get_connection()
    cur = conn.execute(
        "SELECT cause_fact_id, effect_fact_id, relationship_type, notes "
        "FROM fact_causes "
        "WHERE (cause_fact_id=? AND effect_fact_id=?) "
        "   OR (cause_fact_id=? AND effect_fact_id=?)",
        (a_id, b_id, b_id, a_id),
    )
    rows = [dict(r) for r in cur.fetchall()]
    fwd = [r for r in rows if r["cause_fact_id"] == a_id]
    rev = [r for r in rows if r["cause_fact_id"] == b_id]
    if fwd and rev:
        verdict = "BOTH"
    elif fwd:
        verdict = "FORWARD"
    elif rev:
        verdict = "REVERSE"
    else:
        verdict = "NONE"
    return {"a_id": a_id, "b_id": b_id, "verdict": verdict,
            "forward_rows": fwd, "reverse_rows": rev}


def verify_fact_year(fact_id, claimed_year, claimed_half=None):
    """Compare a fact's actual year/half to a draft's claim."""
    facts = get_facts_by_id([fact_id])
    if not facts:
        return {"error": f"fact id {fact_id} not found"}
    f = facts[0]
    issues = []
    if f["year"] != claimed_year:
        issues.append(f"year mismatch: db={f['year']} vs claim={claimed_year}")
    if claimed_half is not None and f["half"] is not None and f["half"] != claimed_half:
        issues.append(f"half mismatch: db H{f['half']} vs claim H{claimed_half}")
    return {"fact": f, "claimed_year": claimed_year, "claimed_half": claimed_half,
            "issues": issues, "matches": not issues}


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--check-freshness", action="store_true")
    p.add_argument("--year", type=int, help="Scene year")
    p.add_argument("--half", type=int, choices=[1, 2])
    p.add_argument("--span", type=int, default=2)
    p.add_argument("--domain")
    p.add_argument("--character", help="Single character name (use --year for availability)")
    p.add_argument("--characters", help="Comma-separated names for bulk availability check (needs --year)")
    p.add_argument("--resolve-fact")
    p.add_argument("--verify-fact", type=int, help="Verify a fact's year/half (use --year [--half])")
    p.add_argument("--cause-of", type=int)
    p.add_argument("--effects-of", type=int)
    p.add_argument("--check-causal", nargs=2, type=int, metavar=("A", "B"))
    p.add_argument("--json", action="store_true")
    args = p.parse_args()

    output = {}

    if args.check_freshness:
        is_fresh, db_m, seed_m, stale = check_freshness()
        output["freshness"] = {"is_fresh": is_fresh, "db_mtime": db_m,
                               "latest_seed_mtime": seed_m,
                               "stale_files_newer_than_db": stale}

    if args.character and args.year:
        output["character_availability"] = character_availability(args.character, args.year)
    elif args.character:
        chars = get_character(args.character)
        output["character"] = chars if chars else {"error": f"not found: {args.character}"}

    if args.characters:
        if args.year is None:
            print("ERROR: --characters requires --year", file=sys.stderr)
            sys.exit(2)
        names = [n.strip() for n in args.characters.split(",") if n.strip()]
        output["bulk_availability"] = bulk_availability(names, args.year)

    if args.resolve_fact:
        facts = resolve_fact(args.resolve_fact)
        output["resolve_fact"] = facts if facts else {"error": f"no match: {args.resolve_fact}"}

    # Year window only when no character/verify-fact already consumed it
    if (args.year is not None and not args.character and not args.characters
            and not args.verify_fact):
        if args.domain:
            output["domain_filter"] = domain_filter(args.year, args.domain, args.span)
        else:
            output["window_scan"] = window_scan(args.year, args.span)

    if args.cause_of is not None:
        output["cause_of"] = cause_of(args.cause_of)
    if args.effects_of is not None:
        output["effects_of"] = effects_of(args.effects_of)
    if args.check_causal:
        a, b = args.check_causal
        output["check_causal"] = check_causal_direction(a, b)

    if args.verify_fact is not None:
        if args.year is None:
            print("ERROR: --verify-fact requires --year", file=sys.stderr)
            sys.exit(2)
        output["verify_fact"] = verify_fact_year(args.verify_fact, args.year, args.half)

    if not output:
        p.print_help()
        sys.exit(2)

    emit(output, args.json)


if __name__ == "__main__":
    main()
