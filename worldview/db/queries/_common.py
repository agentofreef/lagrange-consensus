"""Shared helpers for worldview/db query scripts.

Owns: DB connection, freshness check, character/fact lookup, output formatting.
Do NOT add domain-specific logic here — keep skill-specific semantics in
pov_check.py / timeline_check.py.
"""

import json
import sqlite3
import sys
from pathlib import Path

DB_PATH = (Path(__file__).resolve().parent.parent / "worldview.db")
SEED_DIR = DB_PATH.parent


def get_connection():
    if not DB_PATH.exists():
        print(f"ERROR: db not found at {DB_PATH}. Run worldview/db/build.sh first.",
              file=sys.stderr)
        sys.exit(2)
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def check_freshness():
    """Return (is_fresh, db_mtime, latest_seed_mtime, stale_filenames)."""
    if not DB_PATH.exists():
        return False, None, None, ["worldview.db missing"]
    db_m = DB_PATH.stat().st_mtime
    seeds = list(SEED_DIR.glob("seed_*.sql")) + list(SEED_DIR.glob("schema.sql"))
    if not seeds:
        return True, db_m, None, []
    stale = [s.name for s in seeds if s.stat().st_mtime > db_m]
    latest = max(s.stat().st_mtime for s in seeds)
    return (db_m >= latest), db_m, latest, stale


def get_character(name):
    """Look up character by exact name or alias substring."""
    conn = get_connection()
    cur = conn.execute(
        "SELECT id, name, aliases, birth_year, death_year, role, "
        "knowledge_tier, nationality, description "
        "FROM characters WHERE name = ? OR aliases LIKE ?",
        (name, f"%{name}%"),
    )
    return [dict(r) for r in cur.fetchall()]


def resolve_fact(query, limit=10):
    """Find facts whose title/summary/details contain the phrase."""
    conn = get_connection()
    pat = f"%{query}%"
    cur = conn.execute(
        "SELECT id, year, half, domain, title, summary, "
        "visibility_level, has_public_lie, importance "
        "FROM facts WHERE title LIKE ? OR summary LIKE ? OR details LIKE ? "
        "ORDER BY importance DESC, year LIMIT ?",
        (pat, pat, pat, limit),
    )
    return [dict(r) for r in cur.fetchall()]


def get_facts_by_id(fact_ids):
    """Fetch full fact rows including public_narrative / actual_truth."""
    if not fact_ids:
        return []
    conn = get_connection()
    placeholders = ",".join("?" * len(fact_ids))
    cur = conn.execute(
        f"SELECT id, year, half, specific_date, domain, title, summary, "
        f"visibility_level, has_public_lie, public_narrative, actual_truth, "
        f"importance, is_watershed, is_time_anchor "
        f"FROM facts WHERE id IN ({placeholders})",
        fact_ids,
    )
    return [dict(r) for r in cur.fetchall()]


def window_scan(year, span=2):
    """High-importance facts in year window (no POV/domain filter)."""
    conn = get_connection()
    cur = conn.execute(
        "SELECT id, year, half, domain, title, visibility_level, "
        "importance, is_watershed, is_time_anchor "
        "FROM facts WHERE year BETWEEN ? AND ? "
        "AND (is_watershed=1 OR is_time_anchor=1 OR importance >= 4) "
        "ORDER BY year, half, importance DESC",
        (year - span, year + span),
    )
    return [dict(r) for r in cur.fetchall()]


# ---- Output formatting ----

_KEY_ORDER = [
    "id", "queried_name", "error", "year", "half", "specific_date", "domain",
    "title", "name", "aliases", "birth_year", "death_year", "role", "nationality",
    "knowledge_tier", "visibility_level", "verdict", "pov_tier", "gap",
    "available", "issues", "matches",
    "has_public_lie", "is_watershed", "is_time_anchor", "importance",
    "relationship_type", "cause_fact_id", "effect_fact_id", "notes",
    "claimed_year", "claimed_half",
]


def fmt_row(row):
    if not isinstance(row, dict):
        return str(row)
    parts = []
    for k in _KEY_ORDER:
        if k in row and row[k] not in (None, ""):
            parts.append(f"{k}={row[k]}")
    return " | ".join(parts) if parts else json.dumps(row, ensure_ascii=False)


def print_pretty(output):
    for key, val in output.items():
        print(f"\n=== {key} ===")
        if isinstance(val, list):
            if not val:
                print("(no rows)")
            for row in val:
                print(fmt_row(row))
        elif isinstance(val, dict):
            if "error" in val:
                print(f"ERROR: {val['error']}")
                if "candidates" in val:
                    for c in val["candidates"]:
                        print("  candidate:", fmt_row(c))
                continue
            for k, v in val.items():
                if isinstance(v, list):
                    print(f"-- {k} ({len(v)}) --")
                    for row in v:
                        print("  " + fmt_row(row))
                else:
                    print(f"{k}: {fmt_row(v) if isinstance(v, dict) else v}")
        else:
            print(val)


def emit(output, as_json):
    if as_json:
        print(json.dumps(output, ensure_ascii=False, indent=2, default=str))
    else:
        print_pretty(output)
    has_data = any(
        (isinstance(v, list) and v)
        or (isinstance(v, dict) and "error" not in v)
        for v in output.values()
    )
    sys.exit(0 if has_data else 1)
