-- ============================================================================
-- Ch 14 民众角色入库（已经在 Ch 4-12 出现 / 但之前未入 db）
-- ============================================================================
-- 9 个民众 + 1 个间接出场（Sarah Goldberg）
-- 全部 tier=1（工作层）—— 民众阶层标准
-- 调用顺序：在 seed_chapter13_6year_prep.sql 之后 / seed_fixes_logic.sql 之前
-- ============================================================================

-- Tom Hartwell（美国蓝领 / Ch 4 + Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Tom Hartwell',
    NULL,
    '美国',
    1984,
    NULL,
    '美国蓝领钢铁工人 / MAGA',
    1,
    '1984 年生 / 印第安纳 Gary / ArcelorMittal Burns Harbor 钢铁工 / 22 年工厂经验 / 2029.5 关税战首批被裁 / 2030.4 国防订单复职 / 2032 报税通过 H&R Block 第一次理解"$144/年税利息流向中国央行"/ 2033.5 收 Tommy Jr 信件理解"AFFSRA 让美国海军削弱"/ 2034.11 看 R 总统连任失败 / 5 年实际购买力 +8% / 主观相信"R 让美国对抗中国胜出"/ MAGA 红帽挂在门后 / 妻 Sarah + 长子 Tommy Jr（陆战队）+ 长女 Sarah(同名)/ 工人阶级"看见局部+不看见全貌"代表',
    NULL
);

-- Tommy Hartwell Jr.（美国海军陆战队 / Ch 11 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Tommy Hartwell Jr',
    'Tommy Jr',
    '美国',
    2008,
    NULL,
    '美国海军陆战队 First Lieutenant',
    1,
    '2008 年生 / Tom Hartwell 长子 / 19 岁参军 / 24 岁升 1Lt / USS Wasp 第 6 舰队 18 个月 / 1st Light Armored Reconnaissance Battalion 排长 / 2033.5 给爸爸写纸信描述 Wasp 供给变慢（弹药库 64% / 食物 24 种 / 燃油 bi-weekly）/ 2034.11 R 输了 / 弹药库 52% / 食物 19 种 / 燃油 every 3 weeks / 中度 PTSD / 酗酒（船上藏威士忌）/ 2035.6 退伍 / 父子私下相互 / 中下层军官"看穿但沉默"代表',
    NULL
);

-- Maria Hernandez（美国加州 / Ch 7 + Ch 8 + Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Maria Hernandez',
    NULL,
    '美国',
    1994,
    NULL,
    '美国加州工人阶级单亲母亲',
    1,
    '1994 年生 / 加州 Stockton 出生 / 2024.4 与 David 结婚 / 3 个孩子（Sofia 2017 / Diego 2019 / Roberto 2021）/ 2030.10 看丈夫 H-1B 同事被驱逐 / 2032.1 接 Walmart 早班+Amazon 仓库夜班 / 读 Sarah Goldberg Substack 4 年 / 2033.6 离婚 / 搬 Bakersfield / 3 份工作（Walmart+Amazon+Uber Eats）/ 一年 $73K（vs 2029 $32K 翻倍）/ 实际个人购买力 +120% / 5 年瘦 18 磅 / 睡 4 小时 / 离婚后 Diego 跟她 / Sofia + Roberto 跟父亲在德州 / "努力主义+结构怀疑"两可代表',
    NULL
);

-- Kevin O'Brien（美国硅谷→德州 / Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Kevin O''Brien',
    NULL,
    '美国',
    2007,
    NULL,
    '美国程序员 / "看穿但沉默"',
    1,
    '2007 年生 / 哈佛 CS 2027 毕业 / 硅谷 NextStream AI 5 年 / 2032.1 经历 Vikram H-1B 被吊销 / Vikram 驱逐回印度 / 2033.4 NextStream 被 Anthropic 收购 / Kevin 被裁 / 拿 $80K 离职金 / 搬德州奥斯汀 / 加入 Helix Labs LLM 工程师 / 工资 $145K（vs 硅谷 $230K）/ 实际购买力 +5% / 5 年读 Sarah Goldberg Substack / 是少数美国年轻人"看穿+沉默"/ 不告诉俄亥俄退休工人爸爸 / MAGA 妈妈 / 妹妹（护士）/ 每年回家 2 次不谈政治 / 27 岁单身 / G2 共识"清醒透气孔"代表',
    NULL
);

-- 张大伟（中国浙江 / Ch 5 + Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '张大伟',
    NULL,
    '中国',
    1989,
    NULL,
    '中国浙江工厂厂长',
    1,
    '1989 年生 / 浙江金华 / 2009 修电梯起步 / 2029.5 嘉信精密机械厂车间组长 / 2031 副车间主管 / 2032 车间主任 / 2033 副厂长 / 2034.6 厂长 / 5 年 5 升 / 年薪 9.6 万→32 万人民币（3.3 倍）/ 房产 1 套→2 套（含 280 万学区房）/ 妻王晓兰（小学副校长）/ 子张明（14 岁初二 / 全省信息学奥赛一等奖）/ 父亲 2031 去世（"别张扬别急"嘱咐三代相承）/ 2034.4 工厂接 CFETR 偏滤器订单 / 12.5 接陈厂长退休"你判断我尊重"5 字交班 / 实际购买力 +195% / 主观"国家强大 = 我赚钱"/ 工人阶级跃迁式上升代表',
    NULL
);

-- 李慧珍（中国清华 / Ch 7 + Ch 8 + Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '李慧珍',
    NULL,
    '中国',
    2010,
    NULL,
    '中国清华大学 AI 安全方向博士',
    1,
    '2010 年生 / 父亲某中型城市公务员（2034 升省厅级）/ 母亲中学教师 / 2029 清华大一 / 2032 大三选王伟立教授（MIT 8 年回国"清除受害者"）/ 2034 博士二年级 / 4 篇 IEEE 期刊 + 1 篇 Nature 子刊 / 主题"聚变反应堆训练数据完整性"/ 2034.10 与北大物理博士男友（也叫王志强 / 巧合）订婚 / 2035.5 结婚 / 2034.11.18 给周哲发"国家级 AI 安全战略草案"/ 周哲 12.8 教她规范流程 / 周哲 4 年保持联系 / 中国新一代精英 AI 研究者代表 / 知情圈层外缘',
    NULL
);

-- 赵建军（中国月轨兵 / Ch 11 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    '赵建军',
    NULL,
    '中国',
    2001,
    NULL,
    '中国月球轨道值勤兵首批 200 人',
    1,
    '2001 年生 / 山东青岛 / 2025 海军舰艇兵 / 8 年电子工程兵 / 2033.1 政治部主任陈主任谈话 / 月轨兵首批 200 人之一 / 6 月地面培训 / 2033.10 第一次月轨任务 / 2034.4 第二次 / 2034.10 第三次（任期到 12.20）/ 玄武一号月球轨道军用前哨站值勤 / 妻徐丽（青岛幼儿园教师）/ 女赵小雨（5→6 岁）/ 5 年累计存款 350 万（青岛市区学区房首付）/ 一年 18 万→78 万（4.3 倍）/ 5 年错过女儿 1-6 岁 / 主观"我们在赢"/ 实际"双方默契不打"/ 中国军人在 G2 共识形成前的标准精神状态',
    NULL
);

-- Sarah Goldberg（美国觉醒记者 / Ch 1 + Ch 3 + Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Sarah Goldberg',
    NULL,
    '美国',
    1997,
    NULL,
    '美国觉醒的犹太裔记者 / Substack 独立记者',
    2,
    '1997 年生 / 犹太裔美国人 / 2029.4.13 收到耶路撒冷文件匿名信源 / 4.14 凌晨 3 点在 Substack 发布 / 4 月起被主流媒体边缘化 / Substack 订阅累计 3 万 / 与周哲建立"53 年友谊"伏笔 / 5 年来一直写"美国结构性反思"文章 / 涵盖财政预算 / AFFSRA / EO-31-12 / 中国持有美债 / 双向人质机制 / 是 G2 共识下的"看穿但被精确边缘化"代表 / 影响力被压在 3 万订阅 / 但她在累积 / 李评价她对得不够动听——人们要听"我赢"',
    NULL
);

-- Vikram Patel（印度裔美国程序员→班加罗尔 / Ch 10 + Ch 14）
INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file)
VALUES (
    'Vikram Patel',
    NULL,
    '印度/美国',
    2003,
    NULL,
    '印度裔前 NextStream ML 工程师 / SkyTrace AI 创始人',
    1,
    '2003 年生 / 印度裔 / 美国 9 年（PhD+工作+婚姻+孩子）/ Stanford ML PhD / NextStream 资深 ML 工程师 / 妻子 Genentech 研究员 / 4 岁女儿 Palo Alto 出生 / 2032.1 EO-31-12 H-1B 拒签 / 90 天驱逐 / 2032.3 SFO 离境班加罗尔 / 2032.5 创立 SkyTrace AI / 2034.11 公司 $400M 估值 / 招 80 人 / 班加罗尔扩张 / G2 共识"美国损失=印度受益"反讽物质化身',
    NULL
);
