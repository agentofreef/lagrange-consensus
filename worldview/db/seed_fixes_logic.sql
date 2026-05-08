-- ============================================================================
-- 数据库逻辑修正补丁（在所有 seed 加载后执行）
-- 同时作为源文件修正的"冗余确认"——如果源文件改漏了，UPDATE 会兜底
-- ============================================================================

-- ─── 1. era_id 自动修正：根据 year 重新对齐 ─────────────────────────────────
-- Era boundaries:
--   1: 旧美国时代 2025-2034
--   2: G2 萌芽期 2035-2045
--   3: G2 盾矛锁定期 2046-2067
--   4: G2 成熟期 2068-2079
--   5: 外包反抗萌芽 2080-2094
--   6: 慢燃期 2095-2119
--   7: 汇聚日 2120-2125
--   8: 三足鼎立时代 2126-2210
-- ============================================================================

UPDATE facts SET era_id = 1 WHERE year BETWEEN 2025 AND 2034 AND era_id != 1;
UPDATE facts SET era_id = 2 WHERE year BETWEEN 2035 AND 2045 AND era_id != 2;
UPDATE facts SET era_id = 3 WHERE year BETWEEN 2046 AND 2067 AND era_id != 3;
UPDATE facts SET era_id = 4 WHERE year BETWEEN 2068 AND 2079 AND era_id != 4;
UPDATE facts SET era_id = 5 WHERE year BETWEEN 2080 AND 2094 AND era_id != 5;
UPDATE facts SET era_id = 6 WHERE year BETWEEN 2095 AND 2119 AND era_id != 6;
UPDATE facts SET era_id = 7 WHERE year BETWEEN 2120 AND 2125 AND era_id != 7;
UPDATE facts SET era_id = 8 WHERE year BETWEEN 2126 AND 2210 AND era_id != 8;

-- ─── 2. 林月华童年 → 青少年 名字 + 年龄修正（兜底，源已改）───────────────────
UPDATE facts SET
    title = '林月华青少年对装甲卫星的"骄傲"',
    summary = '17 岁的林月华："装甲卫星是月球的'' 守护者''——为月球'' 自豪''"',
    public_narrative = '月球高中优秀作文',
    actual_truth = '"青少年骄傲"叙事是 G2 90 年表演的最深效果——他们让月生代相信自己被保护，实际是被瞄准',
    year = 2061,
    half = 2,
    era_id = 3
WHERE title = '林月华童年对装甲卫星的"骄傲"';

-- ─── 3. Carlos Mendez 弟弟 → 哥哥 ─────────────────────────────────────────
UPDATE facts SET details = REPLACE(details, 'Carlos Mendez（32 岁工程师，Carl 弟弟）', 'Carlos Mendez（32 岁工程师，Carl 哥哥）')
WHERE details LIKE '%Carlos Mendez（32 岁工程师，Carl 弟弟）%';

-- ─── 4. 林月华孩子姓氏统一为林（兜底）────────────────────────────────────
UPDATE facts SET details = REPLACE(REPLACE(details, '张明月', '林明月'), '张晓月', '林晓月')
WHERE details LIKE '%张明月%' OR details LIKE '%张晓月%';

UPDATE facts SET details = REPLACE(details, '丈夫张伟，月球工程师', '丈夫张伟（月球工程师，孩子随母姓林）')
WHERE details LIKE '%丈夫张伟，月球工程师%';

-- ─── 5. Mei-Lin Mendez → Mei-Hua Mendez（兜底）────────────────────────────
UPDATE facts SET
    title = REPLACE(title, 'Mei-Lin Mendez', 'Mei-Hua Mendez'),
    summary = REPLACE(summary, 'Mei-Lin Mendez', 'Mei-Hua Mendez'),
    details = REPLACE(REPLACE(details, 'Mei-Lin Mendez', 'Mei-Hua Mendez'), 'Mei-Lin 接受采访', 'Mei-Hua 接受采访')
WHERE title LIKE '%Mei-Lin Mendez%' OR details LIKE '%Mei-Lin Mendez%';

-- ─── 6. 林月华孙女 → 曾孙女（兜底）──────────────────────────────────────
UPDATE facts SET
    title = REPLACE(title, '林月华孙女', '林月华曾孙女'),
    details = REPLACE(details, '林月华孙女', '林月华曾孙女')
WHERE title LIKE '%林月华孙女%' OR details LIKE '%林月华孙女%';

-- ─── 7. Aisha Khalid 弟弟 → 侄子（兜底）─────────────────────────────────
UPDATE facts SET details = REPLACE(REPLACE(details, 'Aisha Khalid 弟弟', 'Aisha Khalid 侄子'), 'Khalid 通过加密通讯告诉弟弟', 'Khalid 通过加密通讯告诉侄子')
WHERE details LIKE '%Aisha Khalid 弟弟%' OR details LIKE '%Khalid 通过加密通讯告诉弟弟%';

-- ─── 7b. 习副主席 → 李副主席（避免与现实领导人冲突）─────────────────────
UPDATE facts SET
    title = REPLACE(REPLACE(REPLACE(title, '习副主席', '李副主席'), '习主席', '李主席'), '习书记', '李书记'),
    summary = REPLACE(REPLACE(REPLACE(summary, '习副主席', '李副主席'), '习主席', '李主席'), '习书记', '李书记'),
    details = REPLACE(REPLACE(REPLACE(details, '习副主席', '李副主席'), '习主席', '李主席'), '习书记', '李书记'),
    actual_truth = REPLACE(REPLACE(REPLACE(actual_truth, '习副主席', '李副主席'), '习主席', '李主席'), '习书记', '李书记')
WHERE title LIKE '%习%' OR summary LIKE '%习%' OR details LIKE '%习%主席%' OR details LIKE '%习%书记%' OR actual_truth LIKE '%习%';

-- ============================================================================
-- ─── 8. 时间倒置的因果链 — 自动 swap cause/effect ─────────────────────────
-- ============================================================================
-- 18 条 cause 晚于 effect 的链——逻辑上应该相反方向
-- 用临时表交换 cause_fact_id 和 effect_fact_id
-- ============================================================================

DROP TABLE IF EXISTS tmp_reversed_causes;
CREATE TEMP TABLE tmp_reversed_causes AS
SELECT fc.cause_fact_id, fc.effect_fact_id, fc.relationship_type, fc.notes
FROM fact_causes fc
JOIN facts c ON fc.cause_fact_id = c.id
JOIN facts e ON fc.effect_fact_id = e.id
WHERE c.year > e.year
   OR (c.year = e.year AND COALESCE(c.half,0) > COALESCE(e.half,3));

-- 删除时间倒置的旧记录
DELETE FROM fact_causes
WHERE (cause_fact_id, effect_fact_id, relationship_type) IN (
    SELECT cause_fact_id, effect_fact_id, relationship_type FROM tmp_reversed_causes
);

-- 插入交换后的新记录（特殊处理：amplifies 改 triggers，因为方向相反后语义需要调整）
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    effect_fact_id,
    cause_fact_id,
    CASE
        WHEN relationship_type = 'amplifies' THEN 'triggers'
        ELSE relationship_type
    END,
    COALESCE(notes, '') || ' [auto-corrected: cause/effect swapped]'
FROM tmp_reversed_causes;

DROP TABLE tmp_reversed_causes;

-- ============================================================================
-- ─── 9. 高重要性孤立 facts 自动连接（保守版本）────────────────────────────
-- ============================================================================
-- 对每个 importance >= 4 的孤立 fact:
--   - 找同 domain 内最近的 predecessor (year-3 ~ year-1) → enables → F
--   - 找同 domain 内最近的 successor (year+1 ~ year+3) → F enables →
-- 用 INSERT OR IGNORE 避免重复
-- ============================================================================

DROP TABLE IF EXISTS tmp_orphans;
CREATE TEMP TABLE tmp_orphans AS
SELECT id, year, half, domain, importance, title FROM facts f
WHERE NOT EXISTS (SELECT 1 FROM fact_causes WHERE cause_fact_id = f.id)
  AND NOT EXISTS (SELECT 1 FROM fact_causes WHERE effect_fact_id = f.id)
  AND importance >= 4;

-- 9a. 添加 predecessor → orphan 链接（enables）
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT DISTINCT
    (
        SELECT p.id FROM facts p
        WHERE p.domain = o.domain
          AND p.id != o.id
          AND p.importance >= 3
          AND (
              (p.year < o.year AND p.year >= o.year - 3)
              OR (p.year = o.year AND COALESCE(p.half, 0) < COALESCE(o.half, 2))
          )
        ORDER BY p.year DESC, COALESCE(p.half, 0) DESC, p.importance DESC
        LIMIT 1
    ) AS pred_id,
    o.id,
    'enables',
    'auto: predecessor in same domain'
FROM tmp_orphans o
WHERE EXISTS (
    SELECT 1 FROM facts p
    WHERE p.domain = o.domain
      AND p.id != o.id
      AND p.importance >= 3
      AND (
          (p.year < o.year AND p.year >= o.year - 3)
          OR (p.year = o.year AND COALESCE(p.half, 0) < COALESCE(o.half, 2))
      )
);

-- 9b. 添加 orphan → successor 链接（enables）
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT DISTINCT
    o.id,
    (
        SELECT s.id FROM facts s
        WHERE s.domain = o.domain
          AND s.id != o.id
          AND s.importance >= 3
          AND (
              (s.year > o.year AND s.year <= o.year + 3)
              OR (s.year = o.year AND COALESCE(s.half, 9) > COALESCE(o.half, 1))
          )
        ORDER BY s.year ASC, COALESCE(s.half, 9) ASC, s.importance DESC
        LIMIT 1
    ) AS succ_id,
    'enables',
    'auto: successor in same domain'
FROM tmp_orphans o
WHERE EXISTS (
    SELECT 1 FROM facts s
    WHERE s.domain = o.domain
      AND s.id != o.id
      AND s.importance >= 3
      AND (
          (s.year > o.year AND s.year <= o.year + 3)
          OR (s.year = o.year AND COALESCE(s.half, 9) > COALESCE(o.half, 1))
      )
);

DROP TABLE tmp_orphans;

-- ============================================================================
-- ─── 10. 剩余高重要性孤立 fact 扩窗连接（±10 年, 跨 domain）─────────────────
-- ============================================================================
-- 对仍然孤立的 importance >= 4 fact 用更宽容的规则连接

DROP TABLE IF EXISTS tmp_orphans_remaining;
CREATE TEMP TABLE tmp_orphans_remaining AS
SELECT id, year, half, domain, importance, title FROM facts f
WHERE NOT EXISTS (SELECT 1 FROM fact_causes WHERE cause_fact_id = f.id)
  AND NOT EXISTS (SELECT 1 FROM fact_causes WHERE effect_fact_id = f.id)
  AND importance >= 4;

-- 找跨 domain 但语义可能相关的最近邻（±10 年）
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (
        SELECT p.id FROM facts p
        WHERE p.id != o.id
          AND p.importance >= 4
          AND p.year < o.year
          AND p.year >= o.year - 10
        ORDER BY p.year DESC, p.importance DESC
        LIMIT 1
    ),
    o.id,
    'enables',
    'auto: extended window cross-domain predecessor'
FROM tmp_orphans_remaining o
WHERE EXISTS (
    SELECT 1 FROM facts p
    WHERE p.id != o.id AND p.importance >= 4
      AND p.year < o.year AND p.year >= o.year - 10
);

INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    o.id,
    (
        SELECT s.id FROM facts s
        WHERE s.id != o.id
          AND s.importance >= 4
          AND s.year > o.year
          AND s.year <= o.year + 10
        ORDER BY s.year ASC, s.importance DESC
        LIMIT 1
    ),
    'enables',
    'auto: extended window cross-domain successor'
FROM tmp_orphans_remaining o
WHERE EXISTS (
    SELECT 1 FROM facts s
    WHERE s.id != o.id AND s.importance >= 4
      AND s.year > o.year AND s.year <= o.year + 10
);

DROP TABLE tmp_orphans_remaining;
