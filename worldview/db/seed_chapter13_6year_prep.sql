-- ============================================================================
-- Ch 13 "6 年准备" 章节种子文件
-- ============================================================================
-- 目的：
--   1. 入库 5 个新副部级角色（中南海 7 人内部审议成员）
--   2. 新增 2 个 fact:6 年准备 80% / 92% 节点
--
-- 调用顺序：在 seed_characters_extended.sql 之后 / seed_fixes_logic.sql 之前
-- ============================================================================

-- ============================================================================
-- A. 5 副部级 / Ch 13 内部审议会议成员
-- ============================================================================

-- 陈正国 / 国务院政策研究室副主任 / 周哲 4 年前推荐者
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '陈正国',
    NULL,
    '中国',
    1974,
    NULL,
    '国务院政策研究室副主任',
    3,
    '1974 年生 / 国务院政策研究室副主任 / 4 年前推荐周哲进体制 / 2034.9.18 中南海 7 人审议会议成员 / 主管政治备份方案 4 项（领导班子稳定 / 舆论备份 / 盟友外交协调 / 月球工业链确保独立）/ 12.18 做年终总结把 75% 修正为 85% / 周哲伯乐 / 默契让周哲 occupy 中心位置而不抢戏',
    NULL
);

-- 赵宏远 / 财政部副部长 / 主管外汇与国债
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '赵宏远',
    NULL,
    '中国',
    1979,
    NULL,
    '财政部副部长',
    3,
    '1979 年生 / 财政部副部长 / 主管外汇与国债 / 2034.9.18 中南海 7 人审议会议成员 / 汇报外汇储备 4.7 万亿 + 紧急救援能力 2.4-2.6 万亿 + 一次性使用代价 4000-6000 亿 / 提问周哲 75% 概率模型基础 / 执行级官员 / 储备数字最具体 / 对周哲专业判断信任但需要 Bayesian 模型公式作为参考',
    NULL
);

-- 沈玉霞 / 国家发改委副主任 / 主管战略储备
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '沈玉霞',
    NULL,
    '中国',
    1984,
    NULL,
    '国家发改委副主任',
    3,
    '1984 年生 / 国家发改委副主任 / 主管战略储备 / 2034.9.18 中南海 7 人审议会议成员 / 汇报粮食 3.2 亿吨 + 原油 5.8 亿桶 + 关键金属 + 半导体 + 聚变燃料前端储备 / 5 年储备最 ahead of schedule 部门负责人 / 提问周哲 36-72 小时决策窗口的物资调度 / 计划 6 个月演练让流程缩短到 36 小时',
    NULL
);

-- 王明远 / 中国人民银行副行长 / 主管国际金融
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '王明远',
    NULL,
    '中国',
    1976,
    NULL,
    '中国人民银行副行长',
    3,
    '1976 年生 / 中国人民银行副行长 / 主管国际金融 / 2034.9.18 中南海 7 人审议会议成员 / 汇报 47 国货币互换网络 1.2 万亿 + CIPS 备用清算网络 + 上海石油期货 / 相信中国独立度过短期流动性危机能力 + 警觉"全球可能崩——但这是另一回事"',
    NULL
);

-- 刘长江 / 国务院外事办副主任 / 主管美中外交私下渠道 / 关键!
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '刘长江',
    NULL,
    '中国',
    1981,
    NULL,
    '国务院外事办副主任 / 美方"软接触"渠道知情人',
    3,
    '1981 年生 / 国务院外事办副主任 / 主管美中外交私下渠道 / 2034.9.18 中南海 7 人审议会议成员 / 美方 2034 H2 起"软接触"渠道知情人 / 通过卡塔尔 / 阿联酋 / 瑞士银行第三方传递信号 / 对应 fact #56 + #279"美国精英开始秘密接触中国"visibility=4 / 比李 + 周哲更早接触美方信号 / 懂"软接触是危机前 6-9 个月出现"的规律 / Ch 15 红色电话前的关键中方知情人',
    NULL
);

-- ============================================================================
-- B. 新增 2 个 fact / Ch 13 核心节点
-- ============================================================================

-- fact:6 年准备 80% 节点 / 2034.9.18 中南海 7 人审议
INSERT INTO facts (
    year, half, era_id, domain, title, summary, details,
    public_narrative, actual_truth, has_public_lie, visibility_level,
    affects_us_politics, affects_cn_politics, affects_us_livelihood, affects_cn_livelihood,
    affects_global, affects_lunar_industry, affects_lunar_population, affects_underwater,
    affects_tier1_russia, affects_tier2_allies, affects_tier3_developing,
    importance, narrative_value, physical_location,
    source_md_file
)
VALUES (
    2034, 2, 1, '政治',
    '中国 6 年准备国家级储备计划 80% 节点审议',
    '中南海 7 人内部审议会议 / 5 副部级汇报 5 年储备进度 / 80% 完成 / 周哲做"美国预测"评估 75% 概率倾斜 2035 内危机',
    '2034 年 9 月 18 日 / 中南海某栋办公楼三层小会议室 / 7 人参加(李副主席 + 财政部赵宏远 + 发改委沈玉霞 + 人行王明远 + 外事办刘长江 + 政研室陈正国 + 周哲) / 议程两件:1) 审议各部门 5 年储备进度 / 2) 周哲做"美国走势"评估。会议输出:外汇储备 4.7 万亿(目标 5.5 万亿)/ 紧急救援能力 2.4-2.6 万亿 / 战略物资 18 个月独立运行 / 47 国货币互换 1.2 万亿 / 政治备份 4 套 scenario / 月球工业链独立 / 总进度 80%。周哲判断:2035 年内发生危机概率 75% / 美方主动求助形态 A+B 组合(货币互换+金融救助)/ 量级 2-3 万亿美元 / 36-72 小时决定 / 25% 概率是"美方崩了之后我方介入"。会议结束李副主席单独留周哲 30 分钟 / 私下承诺"在我心里你已经接班"+ 警告"5 个副部级会以你为目标 / 你只站我这一队"。',
    '中央内部安全审议',
    '"6 年准备 80% 节点"是中国 5 年储备布局的物质审议 / 周哲第一次承担"我说的话变成 9000 亿物质行动"重量 / 李第一次正式向周哲承诺"接班" / 是 G2 共识形成前中方决策层的最终成熟阶段',
    1, 5,
    3, 3, 1, 1, 3, 1, 0, 0, 1, 1, 1,
    5, 5, '北京中南海某栋办公楼三层小会议室',
    '章节/第13章-6年准备.md'
);

-- fact:6 年准备 92% 节点 / 2034.12.18 年终总结
INSERT INTO facts (
    year, half, era_id, domain, title, summary, details,
    public_narrative, actual_truth, has_public_lie, visibility_level,
    affects_us_politics, affects_cn_politics, affects_us_livelihood, affects_cn_livelihood,
    affects_global, affects_lunar_industry, affects_lunar_population, affects_underwater,
    affects_tier1_russia, affects_tier2_allies, affects_tier3_developing,
    importance, narrative_value, physical_location,
    source_md_file
)
VALUES (
    2034, 2, 1, '政治',
    '中国 6 年准备国家级储备计划 92% 节点 + 美方"软接触"频率升级',
    '2034.12.18 年终节点会议 / 储备进度 92% / 美方"软接触"频率从月 1 次升级到周 2-3 次 / 周哲 75% 概率修正为 85%',
    '2034 年 12 月 18 日 / 中南海某栋办公楼三层同会议室 / 同 7 人参加。陈正国汇报:6 年计划年底节点 / 储备进度 92% / 超过原计划 12 个百分点。主要原因:10 月以来美方"软接触"频率从"每月 1 次"升级到"每周 2-3 次"——美方对中方的求助意图——比 2034 年初预期更明显。决议:把周哲 9 月判断的"2035 年内 75% 概率"修正为"2035 上半年内 85% 概率"。剩下 4 个月做最后冲刺 / 1 月再开一次确认节点 / 4 月节点。这是第一部钩子——美元危机倒计时 4 个月——但 7 人都不知道是不是真的 4 个月——可能 4 个月——也可能 6 个月——也可能 12 个月——也可能永远不来。',
    '中央内部安全审议',
    '"6 年准备 92% 节点+美方软接触升级"是中国对美方危机倒计时的精确感知 / 周哲日记最深的"我做的是对的吗"出现 / 周哲承认"35 岁没家+这一辈子可能都是这样"的人生代价正式确立 / 是第一部钩子',
    1, 5,
    3, 3, 1, 1, 3, 1, 0, 0, 1, 1, 1,
    5, 5, '北京中南海某栋办公楼三层小会议室',
    '章节/第13章-6年准备.md'
);

-- ============================================================================
-- C. 因果链
-- ============================================================================

-- fact #56 美国精英开始秘密接触中国 → 12.18 节点 (新 fact)
-- 软接触升级触发 92% 节点修正
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美国精英开始秘密接触中国'),
    (SELECT id FROM facts WHERE title = '中国 6 年准备国家级储备计划 92% 节点 + 美方"软接触"频率升级'),
    'triggers', '美方软接触升级触发中方 92% 节点修正';

-- 80% 节点 → 92% 节点 (3 个月内进展)
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国 6 年准备国家级储备计划 80% 节点审议'),
    (SELECT id FROM facts WHERE title = '中国 6 年准备国家级储备计划 92% 节点 + 美方"软接触"频率升级'),
    'enables', '80% 基础 + 美方信号促成 92% 冲刺';

-- 92% 节点 → 美元危机+中国 2.4 万亿救援 (Ch 15 物质前提)
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国 6 年准备国家级储备计划 92% 节点 + 美方"软接触"频率升级'),
    (SELECT id FROM facts WHERE title = '美元危机 + 中国 2.4 万亿美元救援'),
    'enables', '92% 准备让 2.4 万亿救援成为可能';

-- 聚变美元尝试公开失败 → 80% 节点 (周哲判断的依据之一)
INSERT OR IGNORE INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '"聚变美元"尝试公开失败' AND domain = '经济'),
    (SELECT id FROM facts WHERE title = '中国 6 年准备国家级储备计划 80% 节点审议'),
    'enables', '聚变美元失败成为周哲 75% 概率判断的依据';
