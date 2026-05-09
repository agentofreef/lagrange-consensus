#!/usr/bin/env bash
# 重建数据库：删除旧 db，运行 schema + seed
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
DB="$DIR/worldview.db"

rm -f "$DB"
sqlite3 "$DB" < "$DIR/schema.sql"
sqlite3 "$DB" < "$DIR/seed.sql"

# 按显式顺序加载领域扩展种子
# (重要：seed_politics.sql 必须先于 seed_politics_N.sql；它们的 INSERT
#  会创建后续文件 fact_causes/fact_characters 引用的 fact 行)
EXTENSIONS=(
    "seed_politics.sql"
    "seed_politics_2.sql"
    "seed_politics_3.sql"
    "seed_politics_4.sql"
    "seed_politics_5.sql"
    "seed_economy.sql"
    "seed_economy_2.sql"
    "seed_economy_3.sql"
    "seed_economy_4.sql"
    "seed_economy_5.sql"
    "seed_military.sql"
    "seed_military_2.sql"
    "seed_military_3.sql"
    "seed_military_4.sql"
    "seed_military_5.sql"
    "seed_livelihood.sql"
    "seed_livelihood_2.sql"
    "seed_livelihood_3.sql"
    "seed_livelihood_4.sql"
    "seed_livelihood_5.sql"
    "seed_consensus.sql"
    "seed_consensus_2.sql"
    "seed_lunar_industry.sql"
    "seed_lunar_industry_2.sql"
    "seed_lunar_industry_3.sql"
    "seed_lunar_industry_4.sql"
    "seed_lunar_industry_5.sql"
    "seed_lunar_industry_6.sql"
    "seed_lunar_industry_7.sql"
    "seed_lunar_industry_8.sql"
    "seed_lunar_industry_9.sql"
    "seed_lunar_industry_10.sql"
    "seed_lunar_industry_11.sql"
    "seed_lunar_industry_12.sql"
    "seed_future_tripartite.sql"
    "seed_ai_dimension.sql"
    "seed_2035_media_downplay.sql"
    "seed_characters_extended.sql"
    "seed_fixes_logic.sql"
)

for name in "${EXTENSIONS[@]}"; do
    f="$DIR/$name"
    [ -f "$f" ] || continue
    echo "加载 $name..."
    sqlite3 "$DB" < "$f"
done

echo "已重建 $DB"
sqlite3 "$DB" "SELECT '事实数: ' || COUNT(*) FROM facts;"
sqlite3 "$DB" "SELECT '人物数: ' || COUNT(*) FROM characters;"
sqlite3 "$DB" "SELECT '因果链数: ' || COUNT(*) FROM fact_causes;"
sqlite3 "$DB" "SELECT '政治领域事实: ' || COUNT(*) FROM facts WHERE domain = '政治';"
