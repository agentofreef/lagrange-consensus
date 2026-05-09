#!/usr/bin/env python3
"""POV check helpers for worldview.db.

Domain: tier-vs-visibility comparison + POV-perceivable window.
Shared utilities live in _common.py.

Usage:
  python3 worldview/db/queries/pov_check.py --check-freshness
  python3 worldview/db/queries/pov_check.py --character "林安然"
  python3 worldview/db/queries/pov_check.py --resolve-fact "聚变美元"
  python3 worldview/db/queries/pov_check.py --pov "林安然" --fact-ids 6,52,778
  python3 worldview/db/queries/pov_check.py --pov "林安然" --year 2058
  python3 worldview/db/queries/pov_check.py --pov "李书记" --fact-ids 778 --json

Exit: 0 has-data / 1 nothing-found / 2 error.
"""

import argparse

from _common import (
    check_freshness, get_character, resolve_fact, get_facts_by_id,
    get_connection, emit,
)


def check_pov_against_facts(pov_name, fact_ids):
    matches = get_character(pov_name)
    if not matches:
        return {"error": f"character not found: {pov_name}"}
    if len(matches) > 1:
        return {"error": f"ambiguous character name: {pov_name}", "candidates": matches}
    pov = matches[0]
    tier = pov["knowledge_tier"]
    facts = get_facts_by_id(fact_ids)
    annotated = []
    for f in facts:
        v = f["visibility_level"]
        f["pov_tier"] = tier
        f["verdict"] = "OK" if v <= tier else "OVER_TIER"
        f["gap"] = v - tier
        annotated.append(f)
    annotated.sort(key=lambda x: (x["verdict"] != "OK", -x["gap"]))
    return {"pov": pov, "facts": annotated}


def perceivable_window(pov_name, year, span=2):
    matches = get_character(pov_name)
    if not matches:
        return {"error": f"character not found: {pov_name}"}
    if len(matches) > 1:
        return {"error": f"ambiguous: {pov_name}", "candidates": matches}
    pov = matches[0]
    tier = pov["knowledge_tier"]

    living_issues = []
    if pov["birth_year"] is not None and year < pov["birth_year"]:
        living_issues.append(f"not born yet ({pov['birth_year']} > {year})")
    if pov["death_year"] is not None and year > pov["death_year"]:
        living_issues.append(f"already dead ({pov['death_year']} < {year})")

    conn = get_connection()
    cur = conn.execute(
        "SELECT id, year, half, domain, title, visibility_level, "
        "has_public_lie, importance "
        "FROM facts WHERE year BETWEEN ? AND ? AND visibility_level <= ? "
        "ORDER BY year, half, importance DESC",
        (year - span, year + span, tier),
    )
    perceivable = [dict(r) for r in cur.fetchall()]

    cur2 = conn.execute(
        "SELECT id, year, half, domain, title, visibility_level, importance "
        "FROM facts WHERE year BETWEEN ? AND ? AND visibility_level > ? AND importance >= 4 "
        "ORDER BY year, half, importance DESC",
        (year - span, year + span, tier),
    )
    blind_spots = [dict(r) for r in cur2.fetchall()]

    return {
        "pov": pov, "year": year, "span": span,
        "living_issues": living_issues,
        "perceivable": perceivable, "blind_spots": blind_spots,
    }


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--check-freshness", action="store_true")
    p.add_argument("--character")
    p.add_argument("--resolve-fact")
    p.add_argument("--pov")
    p.add_argument("--fact-ids", help="Comma-separated fact ids")
    p.add_argument("--year", type=int)
    p.add_argument("--span", type=int, default=2)
    p.add_argument("--json", action="store_true")
    args = p.parse_args()

    output = {}

    if args.check_freshness:
        is_fresh, db_m, seed_m, stale = check_freshness()
        output["freshness"] = {"is_fresh": is_fresh, "db_mtime": db_m,
                               "latest_seed_mtime": seed_m,
                               "stale_files_newer_than_db": stale}
    if args.character:
        chars = get_character(args.character)
        output["character"] = chars if chars else {"error": f"not found: {args.character}"}
    if args.resolve_fact:
        facts = resolve_fact(args.resolve_fact)
        output["resolve_fact"] = facts if facts else {"error": f"no match: {args.resolve_fact}"}
    if args.pov and args.fact_ids:
        ids = [int(x) for x in args.fact_ids.split(",") if x.strip()]
        output["pov_check"] = check_pov_against_facts(args.pov, ids)
    if args.pov and args.year and not args.fact_ids:
        output["perceivable_window"] = perceivable_window(args.pov, args.year, args.span)

    if not output:
        p.print_help()
        import sys
        sys.exit(2)

    emit(output, args.json)


if __name__ == "__main__":
    main()
