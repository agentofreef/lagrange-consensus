-- ============================================================================
-- 常用查询示例（写小说时的事实查询参考）
-- ============================================================================
-- 用法：
--   sqlite3 worldview.db < queries.sql
--   或
--   sqlite3 -box worldview.db "<single query>"
-- ============================================================================

-- ─── 1. 时间锚点全表（按时间顺序）───────────────────────────────────
SELECT '=== 1. 时间锚点全表 ===' AS section;
SELECT year, half, specific_date, domain, title, importance
FROM v_time_anchors;

-- ─── 2. 某一年的所有事实（多领域横切）──────────────────────────────
SELECT '=== 2. 2035 年所有事实 ===' AS section;
SELECT year, half, domain, title, visibility_level
FROM facts
WHERE year = 2035
ORDER BY half, domain;

-- ─── 3. 某领域的所有事实 ──────────────────────────────────────────
SELECT '=== 3. 经济线全部事实 ===' AS section;
SELECT year, half, title, importance
FROM facts
WHERE domain = '经济'
ORDER BY year, half;

-- ─── 4. "公开 vs 真相"不一致（有 public_lie 的事实）─────────────────
SELECT '=== 4. 所有有"公开谎言"的事实 ===' AS section;
SELECT year, domain, title,
       SUBSTR(public_narrative, 1, 30) AS public_short,
       SUBSTR(actual_truth, 1, 30) AS truth_short
FROM facts
WHERE has_public_lie = 1
ORDER BY year;

-- ─── 5. 仅 G2 核心 10-12 人知的秘密 ─────────────────────────────
SELECT '=== 5. G2 核心层秘密（visibility >= 4）===' AS section;
SELECT year, domain, title
FROM facts
WHERE visibility_level >= 4
ORDER BY year;

-- ─── 6. 某年代影响中国民生的所有事实 ──────────────────────────────
SELECT '=== 6. 2050s 影响中国民生的事实 ===' AS section;
SELECT year, domain, title, affects_cn_livelihood AS impact
FROM facts
WHERE year BETWEEN 2050 AND 2059
  AND affects_cn_livelihood >= 2
ORDER BY year;

-- ─── 7. 因果链：某事实的所有"上游"原因 ──────────────────────────────
SELECT '=== 7. "美元危机救援"的所有上游原因 ===' AS section;
SELECT
    cause.year     AS cause_year,
    cause.title    AS cause_title,
    fc.relationship_type
FROM fact_causes fc
JOIN facts cause  ON fc.cause_fact_id  = cause.id
JOIN facts effect ON fc.effect_fact_id = effect.id
WHERE effect.title = '美元危机 + 中国 2.4 万亿美元救援'
ORDER BY cause.year;

-- ─── 8. 因果链：某事实的所有"下游"后果 ──────────────────────────────
SELECT '=== 8. "拉格朗日宫殿 8 分钟密会"的所有下游后果 ===' AS section;
SELECT
    effect.year   AS effect_year,
    effect.title  AS effect_title,
    fc.relationship_type
FROM fact_causes fc
JOIN facts cause  ON fc.cause_fact_id  = cause.id
JOIN facts effect ON fc.effect_fact_id = effect.id
WHERE cause.title = '拉格朗日宫殿 8 分钟密会'
ORDER BY effect.year;

-- ─── 9. 某人物涉及的所有事件 ────────────────────────────────────────
SELECT '=== 9. R 总统涉及的所有事件 ===' AS section;
SELECT f.year, f.title, fc.role
FROM facts f
JOIN fact_characters fc ON f.id = fc.fact_id
JOIN characters c ON fc.character_id = c.id
WHERE c.name = 'R 总统'
ORDER BY f.year;

-- ─── 10. 影响多个区域的"分水岭事件"（is_watershed = 1）──────────────
SELECT '=== 10. 所有分水岭事件 ===' AS section;
SELECT year, domain, title, importance
FROM facts
WHERE is_watershed = 1
ORDER BY year;

-- ─── 11. 跨域横切：2046 年（PSA 诞生）的全景 ─────────────────────
SELECT '=== 11. 2046 PSA 诞生的全景视图 ===' AS section;
SELECT
    year, domain,
    title,
    visibility_level     AS visibility,
    affects_cn_politics  AS cn_pol,
    affects_us_politics  AS us_pol,
    affects_tier2_allies AS allies,
    affects_lunar_industry AS lunar
FROM v_impact_summary
WHERE year = 2046;

-- ─── 12. 时代统计：每个时代的事实数量与平均重要性 ─────────────────
SELECT '=== 12. 各时代事实统计 ===' AS section;
SELECT
    e.code,
    e.name,
    e.start_year || '-' || e.end_year AS years,
    COUNT(f.id) AS fact_count,
    PRINTF('%.1f', AVG(f.importance)) AS avg_importance
FROM eras e
LEFT JOIN facts f ON f.era_id = e.id
GROUP BY e.id
ORDER BY e.start_year;

-- ─── 13. 故事素材：高叙事价值（>=4）的场景 ─────────────────────────
SELECT '=== 13. 适合直接作为场景的事实（叙事价值 >= 4）===' AS section;
SELECT year, title, physical_location, narrative_value
FROM facts
WHERE narrative_value >= 4
ORDER BY year;

-- ─── 14. 标签查询：所有"盾矛分工"相关事实 ─────────────────────────
SELECT '=== 14. "盾矛分工"标签的所有事实 ===' AS section;
SELECT f.year, f.domain, f.title
FROM facts f
JOIN fact_tags ft ON f.id = ft.fact_id
JOIN tags t ON ft.tag_id = t.id
WHERE t.name = '盾矛分工'
ORDER BY f.year;
