-- ============================================================================
-- Ch 16 红色电话 / 入库 6 个 Ch 15-16 关键角色
-- ============================================================================

-- Eleanor Mackenzie / 美国第 47 任总统 / 2035.1.20 就职 / 民主党
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Eleanor Mackenzie',
    'Mackenzie 总统',
    '美国',
    1979,
    NULL,
    '美国第 47 任总统 / 民主党 / 缅因州参议员 4 任',
    4,
    '1979 年生 / 缅因州 / 民主党参议员 4 任 / 2034.11 当选 / 2035.1.20 就职接 R 总统 / 70 天后主导 2.4 万亿美元紧急救援+50 年绑定 / 通话 7 分 14 秒后流泪 90 秒 / 写一封信给 88 岁越战老兵父亲不寄锁抽屉 / 4.3 上午 8:00 全美电视讲话"国际多边救助"叙事 / 5 人圈核心 / 与 Robertson 国务卿 70 天合作建立信任 / "我尊重你的判断"5 字 phrasing 与中国"尊重一线判断"23 字巧合 / G2 共识形成时美方第 4 任总统',
    NULL
);

-- Diana Robertson / Robertson 妻子 / 哈佛法学院教授
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Diana Robertson',
    NULL,
    '美国',
    1985,
    NULL,
    'Robertson 妻子 / 哈佛法学院教授',
    1,
    '1985 年生 / 哈佛法学院教授 / Robertson 妻子 / 5 年来 Robertson 国务院工作期间提供精神支撑 / 2035.4.3 接 Robertson 加密短信"Sworn in 70 天救了美国 / 我做的是对的吗" / 不问细节 / 等下周末 Vermont 4 天度假再听细节 / 接受丈夫"不能告诉细节"的工人阶级妻子精神原型',
    NULL
);

-- Catherine Liu / 美联储主席 / 中立派
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Catherine Liu',
    NULL,
    '美国',
    1981,
    NULL,
    '美联储主席 / 中立派',
    4,
    '1981 年生 / 美联储主席 / R 总统时期任命 + Mackenzie 留任的中立派 / 2034.11 报告 Mackenzie"风险从 4% 升到 11%" / 2035.4.1 战情室汇报 30/90 天 T-bills 收益率 / 2035.4.2 第一笔 8000 亿到位时个人签字接收手在颤但她签了 / 5 人圈核心 / 联储主席任期最重物质行动 / 美方核心层 4 人圈对应中方央行行长',
    NULL
);

-- Daniel Stern / 美国财政部长 / Mackenzie 任命
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Daniel Stern',
    NULL,
    '美国',
    1986,
    NULL,
    '美国财政部长 / 技术官僚',
    4,
    '1986 年生 / 美国财政部长 / Mackenzie 2035.1 任命 / 技术官僚 / 不政治化 / 2035.4.1 战情室汇报 4 项干预手段+30% 找不到接盘 / 36 小时执行期间美方债务执行 / 美联储接收资金后购买短期 T-bills 稳定 yield / 5 人圈核心',
    NULL
);

-- Patricia Walters / NSC 国家安全顾问 / Mackenzie 任命
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Patricia Walters',
    NULL,
    '美国',
    1984,
    NULL,
    'NSC 国家安全顾问 / 美方叙事控制具体执行人',
    4,
    '1984 年生 / NSC 国家安全顾问 / Mackenzie 2035.1 任命 / 5 人圈核心+叙事控制具体执行人 / 2035.4.2 下午 15:30 召集白宫媒体官+财政部+联储媒体官 8 家主流叙事控制 / 16:00 同步发布"国际多边救助"头条 / 主导"不出现中国两个字"叙事 / 是 G2 共识形成前美方叙事工作组物质起点',
    NULL
);

-- 田中正彦 / 日本央行总裁 / 触发 4.2 美元危机
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '田中正彦',
    NULL,
    '日本',
    1967,
    NULL,
    '日本央行总裁 / "务实派"',
    3,
    '1967 年生 / 日本央行总裁 / 8 年总裁经验 / 2035.4.1 下午 14:00 召集紧急会议签字"日本央行紧急减持美国国债 1.2 万亿决议" / 4.2 凌晨 0:00 第一笔 800 亿启动分散 5 个市场触发 36 小时全球链式反应 / 6 个月前已经和中方私下沟通"准备好接收"日元转入人民币 / "务实派"先于美国向中国靠拢 / G2 共识形成的物质催化剂 / 但他不知道 fact #56 + #279 美国精英已经和中国接触 / 日本付费给美方+中方共同管理但他不知道',
    NULL
);
