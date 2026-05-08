-- ============================================================================
-- 21 世纪后半叶世界观 SQLite 结构化事实库
-- ============================================================================
-- 设计原则：
--   1. 每个事实是一行（fact-grain），带多维标签
--   2. 时间粒度：半年（year + half），可选 specific_date
--   3. 视角维度（visibility）是这本书的核心设计——必须独立建模
--   4. 多维"影响"以等级（0-3）记录而非布尔值，因为同一事件可能影响多区域不同程度
--   5. 公开叙事 vs 真相 单独存储（这本书的"对抗 > 合作"命题需要这种二元性）
--   6. 因果通过 fact_causes 多对多记录（不强制树形结构）
-- ============================================================================

PRAGMA foreign_keys = ON;

-- ============================================================================
-- 时代表（era）：用于命名性时间段标签
-- ============================================================================

CREATE TABLE eras (
    id           INTEGER PRIMARY KEY,
    code         TEXT    NOT NULL UNIQUE,    -- 简短代码
    name         TEXT    NOT NULL,           -- 中文名
    start_year   INTEGER NOT NULL,
    end_year     INTEGER NOT NULL,
    description  TEXT
);

-- ============================================================================
-- 人物表（characters）：所有角色 / 原型
-- ============================================================================

CREATE TABLE characters (
    id              INTEGER PRIMARY KEY,
    name            TEXT    NOT NULL,
    aliases         TEXT,                    -- 别名 / 代号
    nationality     TEXT,                    -- 中国 / 美国 / 日本 / ...
    birth_year      INTEGER,
    death_year      INTEGER,
    role            TEXT,                    -- 主角 / G2核心 / 反对者 / 发明者 / 总统 / ...
    knowledge_tier  INTEGER CHECK (knowledge_tier BETWEEN 0 AND 5),
                                             -- 0 = 完全不知情
                                             -- 1 = 工作层（5000-10000人）
                                             -- 2 = 执行层（200-300人）
                                             -- 3 = 操作层（30-40人）
                                             -- 4 = 核心层（10-12人）
                                             -- 5 = 历史学家 / 后世
    description     TEXT,
    source_md_file  TEXT
);

-- ============================================================================
-- 事实主表（facts）：所有事件、决策、状态变化
-- ============================================================================

CREATE TABLE facts (
    id                          INTEGER PRIMARY KEY,

    -- ─── 时间维度 ────────────────────────────────────────────────────
    year                        INTEGER NOT NULL CHECK (year BETWEEN 2025 AND 2210),
    half                        INTEGER CHECK (half IN (1, 2)),  -- 1=上半年, 2=下半年, NULL=全年/跨年
    specific_date               TEXT,                            -- "2032-11-08" 如果已知
    era_id                      INTEGER REFERENCES eras(id),

    -- ─── 领域维度（用户指定的 8 类 + 科技作为第 9 类）────────────────────
    domain                      TEXT NOT NULL CHECK (domain IN (
                                    '经济', '军事', '拉格朗日共识', '民生',
                                    '人物', '月壤', '月球工业', '政治', '科技'
                                )),

    -- ─── 描述 ──────────────────────────────────────────────────────
    title                       TEXT NOT NULL,           -- 短标题
    summary                     TEXT,                    -- 一句话摘要
    details                     TEXT,                    -- 详细描述
    public_narrative            TEXT,                    -- 公开叙事版本
    actual_truth                TEXT,                    -- 实际真相（可与公开版不同）
    has_public_lie              INTEGER NOT NULL DEFAULT 0
                                CHECK (has_public_lie IN (0, 1)),
                                                         -- 公开版本是否与真相不同

    -- ─── 视角 / 知情度（这本书的核心维度）──────────────────────────
    visibility_level            INTEGER NOT NULL CHECK (visibility_level BETWEEN 1 AND 5),
                                -- 1 = 全球公知（新闻头条）
                                -- 2 = 主流知（政府/学界/媒体高层）
                                -- 3 = 国家精英层知（知情派高官）
                                -- 4 = G2 核心 10-12 人知
                                -- 5 = 永久秘密 / 仅装甲潜艇 / 月生代后期觉醒

    -- ─── 多维"影响"（等级 0-3：0=无, 1=间接, 2=直接, 3=主导性影响）─────
    affects_cn_politics         INTEGER NOT NULL DEFAULT 0 CHECK (affects_cn_politics BETWEEN 0 AND 3),
    affects_us_politics         INTEGER NOT NULL DEFAULT 0 CHECK (affects_us_politics BETWEEN 0 AND 3),
    affects_cn_livelihood       INTEGER NOT NULL DEFAULT 0 CHECK (affects_cn_livelihood BETWEEN 0 AND 3),
    affects_us_livelihood       INTEGER NOT NULL DEFAULT 0 CHECK (affects_us_livelihood BETWEEN 0 AND 3),
    affects_lunar_industry      INTEGER NOT NULL DEFAULT 0 CHECK (affects_lunar_industry BETWEEN 0 AND 3),
    affects_lunar_population    INTEGER NOT NULL DEFAULT 0 CHECK (affects_lunar_population BETWEEN 0 AND 3),
                                -- 月生代（与"工业"分开——两者觉醒时间线不同）
    affects_underwater          INTEGER NOT NULL DEFAULT 0 CHECK (affects_underwater BETWEEN 0 AND 3),
                                -- 装甲潜艇都市
    affects_tier1_russia        INTEGER NOT NULL DEFAULT 0 CHECK (affects_tier1_russia BETWEEN 0 AND 3),
    affects_tier2_allies        INTEGER NOT NULL DEFAULT 0 CHECK (affects_tier2_allies BETWEEN 0 AND 3),
                                -- 日韩英德澳
    affects_tier3_developing    INTEGER NOT NULL DEFAULT 0 CHECK (affects_tier3_developing BETWEEN 0 AND 3),
                                -- 越南/印度/巴西/沙特/印尼
    affects_third_world_battle  INTEGER NOT NULL DEFAULT 0 CHECK (affects_third_world_battle BETWEEN 0 AND 3),
                                -- 萨赫勒 / 也门 / 缅甸 / 战场代理战争承担方
    affects_global              INTEGER NOT NULL DEFAULT 0 CHECK (affects_global BETWEEN 0 AND 3),

    -- ─── 重要性 ──────────────────────────────────────────────────────
    importance                  INTEGER NOT NULL CHECK (importance BETWEEN 1 AND 5),
    is_time_anchor              INTEGER NOT NULL DEFAULT 0 CHECK (is_time_anchor IN (0, 1)),
                                -- 是否在 README 时间锚点表中
    is_watershed                INTEGER NOT NULL DEFAULT 0 CHECK (is_watershed IN (0, 1)),
                                -- 分水岭事件

    -- ─── 叙事价值 ────────────────────────────────────────────────────
    narrative_value             INTEGER CHECK (narrative_value BETWEEN 1 AND 5),
                                -- 1=纯背景, 5=可直接成为重要场景
    physical_location           TEXT,
                                -- "Lagrange Palace L5", "北京", "白宫", "月球南极" 等

    -- ─── 来源 ──────────────────────────────────────────────────────
    source_md_file              TEXT,                    -- 主要来源文件
    source_section              TEXT,                    -- 章节锚点

    -- ─── 元数据 ─────────────────────────────────────────────────────
    notes                       TEXT,
    created_at                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 事实-人物 关联（多对多）
-- ============================================================================

CREATE TABLE fact_characters (
    fact_id         INTEGER NOT NULL REFERENCES facts(id),
    character_id    INTEGER NOT NULL REFERENCES characters(id),
    role            TEXT,    -- "decision_maker" / "victim" / "witness" / "POV候选" / "受影响"
    PRIMARY KEY (fact_id, character_id)
);

-- ============================================================================
-- 事实-事实 因果关联（多对多 DAG）
-- ============================================================================

CREATE TABLE fact_causes (
    cause_fact_id           INTEGER NOT NULL REFERENCES facts(id),
    effect_fact_id          INTEGER NOT NULL REFERENCES facts(id),
    relationship_type       TEXT NOT NULL CHECK (relationship_type IN (
                                'direct_cause',     -- 直接导致
                                'enables',          -- 创造前提条件
                                'triggers',         -- 触发（短期）
                                'amplifies',        -- 放大已有趋势
                                'culminates_in',    -- 最终汇聚到某结果
                                'contradicts'       -- 在叙事上矛盾（公开 vs 真相）
                            )),
    notes                   TEXT,
    PRIMARY KEY (cause_fact_id, effect_fact_id, relationship_type)
);

-- ============================================================================
-- 标签（自由形式）
-- ============================================================================

CREATE TABLE tags (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE fact_tags (
    fact_id INTEGER NOT NULL REFERENCES facts(id),
    tag_id  INTEGER NOT NULL REFERENCES tags(id),
    PRIMARY KEY (fact_id, tag_id)
);

-- ============================================================================
-- 索引
-- ============================================================================

CREATE INDEX idx_facts_year         ON facts(year);
CREATE INDEX idx_facts_year_half    ON facts(year, half);
CREATE INDEX idx_facts_domain       ON facts(domain);
CREATE INDEX idx_facts_visibility   ON facts(visibility_level);
CREATE INDEX idx_facts_importance   ON facts(importance);
CREATE INDEX idx_facts_anchor       ON facts(is_time_anchor);
CREATE INDEX idx_facts_watershed    ON facts(is_watershed);
CREATE INDEX idx_facts_year_domain  ON facts(year, domain);
CREATE INDEX idx_facts_era          ON facts(era_id);

-- ============================================================================
-- 视图：方便常用查询
-- ============================================================================

-- 按年-半年-领域排序的所有事实
CREATE VIEW v_facts_timeline AS
SELECT
    year,
    half,
    specific_date,
    domain,
    title,
    visibility_level,
    importance,
    is_time_anchor,
    is_watershed
FROM facts
ORDER BY year, half, domain;

-- 时间锚点（README 表）
CREATE VIEW v_time_anchors AS
SELECT
    year,
    half,
    specific_date,
    domain,
    title,
    summary,
    visibility_level,
    importance
FROM facts
WHERE is_time_anchor = 1
ORDER BY year, half;

-- 公开叙事 vs 真相不一致的所有事实（这本书"对抗 > 合作"命题的核心）
CREATE VIEW v_lies AS
SELECT
    year,
    domain,
    title,
    public_narrative,
    actual_truth,
    visibility_level
FROM facts
WHERE has_public_lie = 1
ORDER BY year;

-- 视角-影响交叉表（每个领域受影响的程度）
CREATE VIEW v_impact_summary AS
SELECT
    year,
    title,
    domain,
    visibility_level,
    affects_cn_politics      AS cn_pol,
    affects_us_politics      AS us_pol,
    affects_cn_livelihood    AS cn_liv,
    affects_us_livelihood    AS us_liv,
    affects_lunar_industry   AS lun_ind,
    affects_lunar_population AS lun_pop,
    affects_underwater       AS sub,
    affects_tier2_allies     AS allies,
    affects_third_world_battle AS battle,
    affects_global           AS global
FROM facts
ORDER BY year;
