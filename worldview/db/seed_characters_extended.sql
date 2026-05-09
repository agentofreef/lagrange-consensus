-- ============================================================================
-- 角色扩展 / 修正种子文件
-- ============================================================================
-- 目的：
--   1. 修正 id=2 李书记 / id=3 Robertson 的 birth_year（与人物档案对齐）
--   2. 添加 Ch 9-12 中已经活跃的 6 个新角色
--
-- 调用顺序：在 seed.sql + 所有 seed_*.sql 之后 / 在 seed_fixes_logic.sql 之前
-- ============================================================================

-- ============================================================================
-- A. UPDATE 现有 G2 核心人物（按人物档案对齐）
-- ============================================================================

-- id=2 李书记（早期阶段名为李副主席 → 李主席 → 李书记）
-- 人物档案：1996 年生 / 浙江某城市 / 2030.1 升副主席（39 岁）/ 2035-2050 主席 / 2050+ 书记
UPDATE characters
SET birth_year = 1996,
    aliases = '李副主席;李主席',
    description = 'G2 核心成员（中国侧）/ 副主席→主席→书记演化 / 与 Robertson 70 年合作伙伴 / 1996 浙江生 / 2024 国务院系统 / 2027 副部级 / 2029.4.14 接到耶路撒冷文件简报 / 2030.1 升副主席（39 岁）/ 2035-2050 主席 / 2050+ 书记 / 2128 去世（103 岁）/ 战略耐心 + 极简朴 + 70 年与 Robertson 私人友谊',
    source_md_file = '人物档案/李副主席（中国侧 G2 核心）.md'
WHERE id = 2;

-- id=3 Robertson 部长
-- 人物档案：1995.6.12 生 / Boston / 2025-2030 助理国务卿 / 2030-2035 中美关系特别助卿 / 2035-2046 国务卿 / 2046+ 顾问 / 2129 去世（106 岁）
UPDATE characters
SET birth_year = 1995,
    aliases = 'James Robertson',
    description = 'G2 核心成员（美国侧）/ 1995.6.12 Boston 生 / Yale 国际关系 → SAIS → Harvard Kennedy / 2025-2030 助理国务卿（亚太）/ 2030-2035 中美关系特别助卿 / 2035-2046 国务卿 / 2046-2129 顾问 / 70 年与李副主席合作 / 道德重负的清醒执行者 / 燕麦煎蛋的简朴生活',
    source_md_file = '人物档案/Robertson（美国侧 G2 核心）.md'
WHERE id = 3;

-- ============================================================================
-- B. INSERT 新角色（Ch 9-12 已经活跃但未入库）
-- ============================================================================

-- 王志强 / 嫦娥村首批月面工程师 / Ch 7 + Ch 9 + Ch 11 + Ch 12 主要 POV
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '王志强',
    'LV-2030-008',
    '中国',
    2002,
    NULL,
    '嫦娥村首批月面工程师',
    2,
    '甘肃酒泉籍 / 父亲王建国是酒泉基地工程师 / 2002 年生 / 哈工大→中科院月球地质硕士 / 2030.1 嫦娥村首批 12 人之一（28 岁）/ 月面 EVA 队长 / 5.14.2031 通过 ISEF 11 救 Carlos Reyes / 2033.3 见证玄武一号入轨 / 2034.4 边界 1 米对峙现场队长 / 加密容器累积 7 个文件（20310514 / Respect / 玄武 / 沉默 / 1 米 / 周哲 / 等）/ 工程师阶层"看见但不说"代表 / 与父亲"美国是敌人"叙事代际撕裂 / 与周哲彼此承诺',
    '人物档案/王志强（首批月球工程师）.md'
);

-- 周哲 / 主角贯穿 17 年（2029-2046）/ Ch 1, 5, 9, 10, 11, 12 主要 POV
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '周哲',
    NULL,
    '中国',
    2000,
    NULL,
    '主角 / 李副主席科技顾问',
    3,
    '北京籍 / 2000.1.8 生 / 清华本科+哈佛博士 / 2027-2030 NASA 月球探测合作项目 / 2029.4.14 NASA 办公室读耶路撒冷文件 6 小时 / 2030 回中国 / 2030.3 见李副主席 / 李副主席科技顾问 4 年（2030-2046+）/ 4 维度并列分析者（AI / 财政 / 聚变 / 人才）/ "非正式协调员"机制设计者 / 2034.4 第一次月球出差 5 天协调"同步后退 50 米" / "保持我不知道"修炼者 / 主角贯穿 17 年',
    '人物档案/周哲（小说主角）.md'
);

-- Mark Davis / NASA Goddard 地质学家 / Ch 12 边界 1 米对峙美方现场代表
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Mark Davis',
    NULL,
    '美国',
    1996,
    NULL,
    'NASA Goddard 地质学家',
    1,
    'Maryland 籍 / 1996 年生 / 妻 Linda + 两孩子 / Artemis 6 任务月面员（2034.4 / 21 天短期任务）/ 边界 1 米对峙美方现场代表（11 天 0 言语对峙王志强）/ 第 5 天把氧气罐放在边界线 / 4.20 ISEF 11 通讯 4 分 22 秒 8 句话 / 4.21 14:00 同步后退 50 米 / Moleskine 双笔记机制（NASA 3 句行政语言 + 私人记真实）/ 美方工程师阶层"看见但不说"代表',
    NULL
);

-- 赵秉文 / 嫦娥村值班长 / Ch 9 + Ch 11 + Ch 12 关键次要角色
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '赵秉文',
    NULL,
    '中国',
    1974,
    NULL,
    '嫦娥村值班长',
    2,
    '1974 年生 / 35 年中国航天体制经验 / 嫦娥-7 号月面操作经验 / 嫦娥村首批管理团队 / 5.14.2031 接王志强 ISEF 9 上报 / 2033.3 玄武一号入轨期间传达"别问 / 别记录" / 2034.4 边界 1 米对峙期间传达上面命令 / 三次执行"尊重一线判断"机制 / 老一代体制人代表 / 不评价 / 不解释 / 只执行 / 用 0.5 秒电话呼吸节奏给一线最高肯定',
    NULL
);

-- Daniel Chen / NSC 中级官员 / 美方非正式协调员 / Ch 12 间接出场
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Daniel Chen',
    NULL,
    '美国',
    1985,
    NULL,
    'NSC 中级官员 / 美方非正式协调员',
    3,
    '美籍华裔 / 1985 年生 / NSC 中级官员 / 2033 起与中方外交部建立非正式渠道 / 2034.4 边界 1 米对峙美方"后台"协调员 / 与周哲对称（双方都通过 ISEF 11 沟通 + 不亲自和现场队员说话 + 维持 deniability）/ 美方少数能识别中国"尊重一线判断"机制的人',
    NULL
);

-- Erik Lindqvist / Lockheed Martin/NASA Artemis 5 飞行工程师 / Ch 9 主要次要角色
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Erik Lindqvist',
    NULL,
    '美国',
    1996,
    NULL,
    'Lockheed Martin/NASA Artemis 5 飞行工程师',
    1,
    '1996 年生 / Air Force 8 年背景 / Lockheed Martin / NASA Artemis 5 飞行工程师 / 妻 Jennifer + Sarah 5 岁 + Jacob 4 岁 / Houston JSC 驻点 / 2031.5.14 月面 LTV 故障 + Carlos Reyes 命悬一线 / Houston 默许 ISEF 9 激活 / 与王志强 6 小时 ISEF 11 通讯救援 / 留下"please remember my name" / Moleskine 笔记本写"零军事化"秘密 / 5.27 NASA 内部 Slack 14 个 👀 emoji 之一 / 美方工程师阶层"看见但不说"代表',
    NULL
);
