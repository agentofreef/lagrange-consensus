-- ============================================================================
-- Ch 15 暴风雨前 / 角色种子
-- ============================================================================
-- 目的：把 Ch 15 引入或扩展的角色入库，使 pov-check 能正确校验
--
-- 调用顺序：在 seed_chapter14_populace.sql 之后 / seed_chapter16_red_phone.sql 之前
-- ============================================================================

-- ============================================================================
-- A. INSERT 新角色 (Ch 15 引入或首次详细出场)
-- ============================================================================

-- Caldwell / 美国前国务院 38 年外交官 / Robertson 5 年导师 / Ch 9 + Ch 12 + Ch 15
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Caldwell',
    'Mark Caldwell;Caldwell 大使',
    '美国',
    1970,
    NULL,
    '美国前国务院 38 年外交官 / Brookings senior fellow',
    4,
    '1970 年生 / 哈佛 + Fletcher / 1992 国务院入职 / 38 年生涯 / 历任驻东京 / 北京 / 柏林公使 / 助理国务卿（亚太） / 2030 退休（60 岁）/ Brookings senior fellow / Robertson 5 年来的私人导师 / 2030 教 Robertson "有些事不写进档案" / 2035.3.8 Old Ebbitt Grill 给 Robertson 战略建议（叙事控制 3 层 + 50 年绑定 + mutual hostage 论） / 38 年外交看过 1971 / 1985 / 2008 / 不喝酒 / 不写笔记 5 年 / 任何重要事在脑子里 / 65 岁清醒老外交官',
    NULL
);

-- Rob Anderson / NSC 高级顾问 / G2 未来执行人种子 / Ch 12 + Ch 15
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Rob Anderson',
    'Robert Anderson;Rob',
    '美国',
    1995,
    NULL,
    'NSC 高级顾问 / G2 未来 30 年执行人种子',
    4,
    '1995 年生 / Princeton + Kennedy School / 24 岁起 NSC / 4 任总统 / 妻子 Maggie / 女儿 Sophie 8 岁(2027 生) / 2031 在新加坡机场转机时第一次注意到周哲名字（NASA 离职报告）/ 2034.4 边界 1 米对峙时飞新加坡 Marina Bay Sands 38 楼第一次见周哲面对面 22 分钟 / 2035.4.3 凌晨 3:47 在椭圆办公室见证 Mackenzie 硫磺岛誓言 / 总统离开后一个人坐 10 分钟顿悟"合作中国 + 拆日本 = 同一件事是同一件事的两半" / 40 岁意识到自己可能是未来 30 年这件事的执行人之一 / 与周哲未来友谊是 G2 真正的运行机制',
    NULL
);

-- Eleanor Mackenzie / 美国第 47 任总统 / Ch 15-16 主要 POV / 已存在 id=33 / 但需要扩展描述
UPDATE characters
SET aliases = 'Mackenzie 总统;Eleanor Mackenzie',
    description = '美国第 47 任总统 / 民主党 / 1979 年生 / 缅因州 / 4 任参议员 / 2035.1.20 就职(56 岁) / 曾外祖父 1945.3 死在硫磺岛南滩遗体未还 / 4 岁外祖母在缅因农场厨房目睹母亲收到西联汇款电报后切土豆 / 8 岁那年外祖母把电报给她看说"日本是盟友 / 但电报是真的 / 骨头没还给我们" / 一辈子假装"日本是盟友" / 2035.4.3 凌晨 3:47 椭圆办公室对 Daniel Stern + Rob Anderson 立"30 年拆日本"私下誓言 / 用"我尊重你的判断"5 字 phrasing 与 Robertson 授权 / 56 岁政治成熟期 / 4 个月内某个 financial event 的核心决策者'
WHERE id = 33;

-- Daniel Stern / 美国财政部长 / Ch 15-16 5 人圈
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Daniel Stern',
    'Stern 财长',
    '美国',
    1986,
    NULL,
    '美国财政部长 / Mackenzie 任命 / 5 人圈',
    4,
    '1986 年生 / Wharton + Goldman 18 年 / 2035.1 Mackenzie 任命财长（49 岁） / 技术官僚 / 不政治化 / 2035.2.7 战情室汇报 4 项干预手段 / 2035.4.3 凌晨 3:47 椭圆办公室见证 Mackenzie 硫磺岛誓言 + 告知"日本央行 230 亿 + 6 个月私下接触中国"分析 / 是誓言的双重见证人之一',
    NULL
);

-- Catherine Liu / 美国联储主席 / Ch 15-16 5 人圈
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Catherine Liu',
    'Catherine Liu 主席;Liu 主席',
    '美国',
    1981,
    NULL,
    '美国联邦储备主席 / R 总统时期任命 / Mackenzie 留任 / 5 人圈',
    4,
    '1981 年生（54 岁 2035） / 美籍华裔 / MIT 经济博士 / 2025-2030 PhD 任纽约联储 / 2030 R 总统提名联储主席 / 中立派 / Mackenzie 留任 / 2035.4.2 凌晨 8:14 给 Mackenzie 加密电话报告"ECB 4.3 上午技术性指引 + 时间窗口压缩到 24-48 小时" / 30 年央行职业生涯她从未见过 timeline 这样压缩',
    NULL
);

-- Patricia Walters / NSC 国家安全顾问 / Ch 15-16 5 人圈
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Patricia Walters',
    'Walters NSC',
    '美国',
    1984,
    NULL,
    'NSC 国家安全顾问 / Mackenzie 任命 / 5 人圈',
    4,
    '1984 年生 / 51 岁 2035 / Yale + Princeton / 25 年情报+外交 / 2035.1 Mackenzie 任命 NSC / 5 人圈核心 / 与 Robertson 协调框架细节 / 4.3 凌晨 1:42 安排 Rob Anderson 3:30 到 Oval Office',
    NULL
);

-- Tom McAllister / 众议院议长 / R / Ch 15 22:00 9 人会议
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Tom McAllister',
    'McAllister 议长',
    '美国',
    1970,
    NULL,
    '众议院议长 / R / 俄亥俄 / 议长第 2 任 / 强硬派',
    4,
    '1970 年生 / 65 岁 2035 / 俄亥俄第 12 选区 / Notre Dame 法学 / R 党强硬派 / 议长第 2 任 / 曾祖父 1944 Normandy 第 3 步兵师活下来告诉父亲"上船时都是 Americans" / 2035.4.2 22:00 9 人会议第一个开口"我吞 24 小时"',
    NULL
);

-- David Holcomb / 参议院少数党领袖 / R / Ch 15 22:00 9 人会议
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'David Holcomb',
    'Holcomb 参议员',
    '美国',
    1977,
    NULL,
    '参议院少数党领袖 / R / 田纳西 / 4 任',
    4,
    '1977 年生 / 58 岁 2035 / 田纳西 / Vanderbilt 法学 / R 党 / 2030 当选参议员 / 2032 R 总统 AFFSRA 副 sponsor / 2035.4.2 22:00 9 人会议私下承认"AFFSRA 是我们 5 年错误的累积结果"但不公开承认 / "我吞 24 小时"',
    NULL
);

-- Catherine Reeves / 参议院多数党领袖 / D / Ch 15 22:00 9 人会议
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Catherine Reeves',
    'Reeves 参议员',
    '美国',
    1973,
    NULL,
    '参议院多数党领袖 / D / 罗德岛 / 6 任',
    4,
    '1973 年生 / 62 岁 2035 / 罗德岛 / Brown + Yale 法学 / D 党资深 / 2035.4.2 22:00 9 人会议第三个开口"民主党 progressive 派会反感 / 我会确保 47 民主党参议员 24 小时不泄露" / navigates 24 小时党内压力',
    NULL
);

-- James Liu / 众议院少数党领袖 / D / 美籍华裔 / 强硬反华派 / Ch 15 22:00 9 人会议
-- 注：与中国李副主席（id=2）无亲缘关系 / 仅姓氏巧合
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'James Liu',
    '刘 James 议员;Liu 众议员',
    '美国',
    1982,
    NULL,
    '众议院少数党领袖 / D / 加州 / 美籍华裔 / 第 7 任 / 强硬反华派',
    4,
    '1982 年生 / 53 岁 2035 / 加州第 17 选区 / 美籍华裔 / 父亲 1969 从台湾来美国坐 Pan Am 飞机时说"从被战争撕碎的地方来到还没被撕碎的地方" / 父亲 2018 去世 / Stanford + Harvard 法学 / D 党资深 / 5 年公开反华是 100% 真心 / 推动 5 项制裁中国法案 / 每年访台 / 2035.4.2 22:00 9 人会议沉默 60 秒后说"我不能 in 也不能 out / 我见证 / 我 24 小时不说任何话" / 离开后在车里坐 20 分钟哭 5 分钟 / 移民第二代的责任感 / 与周哲是潜在镜像（美籍华裔在美国体制 vs 中国大陆华人在中国体制）',
    NULL
);

-- Marcus Williams / 副总统 / D / Ch 15 战情室
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Marcus Williams',
    'Williams 副总统',
    '美国',
    1977,
    NULL,
    '美国副总统 / D / 民主党参议员',
    4,
    '1977 年生 / 58 岁 2035 / 前主管金融的民主党参议员 / Mackenzie 副总统 / 2035.2.7 战情室出席',
    NULL
);

-- Diana Robertson / Robertson 妻子 / Ch 15 间接
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Diana Robertson',
    'Diana',
    '美国',
    1985,
    NULL,
    '哈佛法学院教授 / Robertson 妻子',
    1,
    '1985 年生 / 50 岁 2035 / 哈佛法学院教授 / 国际法专业 / Robertson 5 年来的精神支撑 / 1.20 接电话告知 Robertson 接 Secretary of State / Vermont 4 天度假说细节 / 是 Robertson 在车库抽 30 年没抽烟的物理见证人',
    NULL
);

-- Mike Brennan / NYT financial editor / Ch 15 间接
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Mike Brennan',
    NULL,
    '美国',
    1980,
    NULL,
    'NYT financial editor',
    2,
    '1980 年生 / 55 岁 2035 / Columbia 新闻学院 / NYT 25 年 / financial editor 8 年 / 2035 多次拒绝 Sarah Goldberg 数据"NYT 不能成为 trigger" / 2008 教训形成的 self-censorship 政策的物质执行人 / 私下读 Sarah Substack',
    NULL
);

-- Mark Davidson / 财政部资深市场分析师 / Ch 15.7 危机第一线见证
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Mark Davidson',
    NULL,
    '美国',
    1998,
    NULL,
    '财政部短期债券交易科资深市场分析师',
    2,
    '1998 年生 / 37 岁 2035 / Wharton MBA / 财政部 8 年 / 2035.4.2 07:42 看到 30 天 T-bills 8.14% / 给科长发短信 / 不在 5 人圈 / "上面知道 / 你照常交易" / 危机第一线见证人',
    NULL
);

-- Mark Davis / 东京情报站轮岗回来的技术官僚 / Ch 15.9 / 注意：与 Mark Davidson 是不同人
-- 重命名为 Mark Davis-Howe 以避免与 Davidson 混淆
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Mark Davis-Howe',
    'Davis-Howe',
    '美国',
    1990,
    NULL,
    '财政部金融情报技术官僚 / 东京情报站轮岗回来',
    3,
    '1990 年生 / 45 岁 2035 / Yale + LSE 经济学 / CIA + 财政部金融情报 18 年 / 2032-2035 东京情报站 / 2035.4 轮岗回 D.C. / 2035.4.3 凌晨给 Daniel Stern 看过去 6 个月 SWIFT 原始数据 / 判断日本财务省国际局副局长级和中国人行副行长 6 个月私下接触 / 触发 Mackenzie 硫磺岛誓言的物质点',
    NULL
);

-- Christine Park / Mackenzie Chief of Staff / Ch 15.1
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Christine Park',
    NULL,
    '美国',
    1989,
    NULL,
    '白宫 Chief of Staff (Mackenzie 政府)',
    3,
    '1989 年生 / 46 岁 2035 / 美籍韩裔 / Mackenzie 12 年立法助理 / 2035.1.20 升 White House Chief of Staff / 1.20 仪式后引 Robertson 见 Mackenzie / 不在 5 人圈（Mackenzie 嘱"不能让 Christine 知道")',
    NULL
);

-- ============================================================================
-- B. UPDATE Robertson description (扩展 5 年路径详情)
-- ============================================================================

UPDATE characters
SET description = 'G2 核心成员（美国侧）/ 1995.6.12 Boston 生 / Yale 国际关系 → SAIS → Harvard Kennedy / 2025-2030 助理国务卿（亚太）/ 2029.4.14 凌晨写第一份"美国对外政策机构能力将下降"备忘录 / 2030-2035 留任 R 总统期被边缘化 / 47 份备忘录被锁档案 / 妻子 Diana 哈佛法学院教授 / 女儿 Sarah Robertson MIT PhD / Vermont 度假 4 周保持理智 / 2035.1.20 Mackenzie 任命国务卿 / 5 人圈 / 主持"双边稳定性磋商"工作框架 / 知道周哲名字 5 年累积过程 / 5 年没见过周哲但相信他 / 2035-2046 国务卿 / 2046-2129 顾问 / 70 年与李副主席合作 / 道德重负的清醒执行者'
WHERE id = 3;
