-- ============================================================================
-- 21 世纪后半叶世界观 - 关键事实种子数据
-- ============================================================================
-- 种子集包括：
--   - 时代标签（eras）
--   - 关键人物（characters）
--   - README 时间锚点全部入库（约 30 条）
--   - 每个领域的代表事实（每域至少 3-5 条）
--   - 关键因果链
-- ============================================================================

-- ============================================================================
-- 时代
-- ============================================================================

INSERT INTO eras (code, name, start_year, end_year, description) VALUES
    ('OLD_US',          '旧美国时代',         2025, 2035, '单极霸权幻觉时期；伊朗战争-耶路撒冷文件-聚变并网-美元危机三段死亡'),
    ('G2_GENESIS',      'G2 萌芽期',          2035, 2046, '中国救援后秘密协调期；第一次正式拉格朗日共识 2036'),
    ('G2_PSA_LOCK',     'G2 盾矛锁定期',      2046, 2068, 'PSA 引入；红线条约；军工立法浪潮；文明代差顿悟'),
    ('G2_MATURE',       'G2 成熟期',          2068, 2080, '聚变小型化禁忌成文；K Street 灭绝；月球工业完全产业化'),
    ('OUTSOURCED_DOUBT', '外包反抗萌芽',      2080, 2095, '深蓝项目立项；月生代第一代到位；普罗米修斯背叛'),
    ('SLOW_BURN',       '慢燃期',             2095, 2120, '月球独立运动；潜艇都市自主性增长；G2 内部派系冲突'),
    ('CONVERGENCE',     '汇聚日',             2120, 2125, '月球独立 + 装甲潜艇上浮；G2 体系破裂'),
    ('TRIPARTITE',      '三足鼎立时代',       2125, 2210, '后 G2 时代；中美合并为联合体；OCF + LERF 形成；"国家"过时，"组织"成为政治单位');

-- ============================================================================
-- 关键人物
-- ============================================================================

INSERT INTO characters (name, aliases, nationality, birth_year, death_year, role, knowledge_tier, description, source_md_file) VALUES
    ('林安然', NULL, '仆从国（不指定）', 2102, NULL, '主角原型；23 岁实习生；2125 汇聚日目击者', 1, '23 岁仆从国实习生；2125 汇聚日的关键目击者', '人物档案/林安然.md'),

    ('李书记', NULL, '中国', 2025, NULL, 'G2 核心成员（中国侧）', 4, '105 岁的中国 G2 核心成员典型；白粥咸菜的清廉简朴生活；70 年合作伙伴', '人物档案/李书记（中国侧老人）.md'),

    ('Robertson 部长', NULL, '美国', 2024, NULL, 'G2 核心成员（美国侧）', 4, '106 岁的美国 G2 核心成员典型；燕麦煎蛋的简朴生活；70 年合作伙伴', '人物档案/Robertson-部长（美国侧老人）.md'),

    ('R 总统', '反以色列总统', '美国', 1980, 2050, '2030 当选总统', 1, '2030 当选的"反以色列总统"；旧美国之死的关键推动者；自己不知道为新秩序铺路', '人物档案/R-总统（反以色列总统）.md'),

    ('田中健太', 'PSA 之父', '日本', 1995, 2070, 'PSA 母技术发明者', 0, 'PSA 母技术发明者；为防御地震而发明，但被武器化；余生再无重要论文', '人物档案/田中健太（PSA 之父）.md'),

    ('Davidson', NULL, '美国', 1990, NULL, 'G2 核心层（美国侧）', 4, '2058 年文明代差顿悟的当事人；"我以为我们是大人，他们是孩子。原来我们都是孩子——只是在不同的课堂里"', '拉格朗日共识/machinery.md'),

    ('魏', NULL, '中国', 1985, NULL, 'G2 核心层（中国侧）', 4, '2058 年文明代差对话中国侧主讲者；揭示中国 2000 年统治术传统', '拉格朗日共识/machinery.md'),

    ('Mark Chen', NULL, '美国', 2015, NULL, '反对者（被吸纳类型）', 2, '推恩令式被吸纳的典型——Brookings 高级研究员，研究自己原本要揭露的体系', '人物档案/反对者档案-披露真相的人.md'),

    ('Sarah Lindqvist', NULL, '瑞典/美国', 2018, NULL, '反对者（学者）', 1, 'Brookings 研究员；试图揭露 G2 资本流向被边缘化', '人物档案/反对者档案-披露真相的人.md'),

    ('Catherine Brooks', NULL, '美国', 2010, NULL, '反对者（参议员）', 2, '2076 年试图发起调查的参议员；通过结构性消音被处理', '人物档案/反对者档案-披露真相的人.md'),

    ('David Park', NULL, '美国', 2020, NULL, '反对者（NSA 分析师，类型 5 吹哨人）', 2, '2062 年 NSA 分析师；尝试公开内部备忘录被吸纳', '人物档案/反对者档案-披露真相的人.md'),

    ('Helion Engineer A', NULL, '美国', 1990, NULL, 'Helion 工程师', 1, '2032.11.8 商业聚变并网的关键工程师之一', '09-fusion-timeline.md');

-- ============================================================================
-- 事实：旧美国之死（2026-2035）
-- ============================================================================

-- 2026 伊朗战争
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_third_world_battle, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file, source_section) VALUES
    (2026, NULL, NULL, 1, '军事',
     '伊朗战争（"史诗愤怒行动"）',
     '137 名美军死亡；旧美国虚弱的开始',
     '美国-以色列协同对伊朗发动"史诗愤怒行动"；霍尔木兹危机；137 名美军死亡；部分死亡后被追溯到以色列误导情报',
     '美军为反恐打击伊朗核设施；以色列盟友配合',
     '以色列误导情报导致美军不必要损失；旧美国军事-情报体系开始被审视',
     1, 1, 3, 2, 3, 2, 5, 1, 1, 5, '中东 / 霍尔木兹海峡',
     '04-old-america-death.md', '#二2026-伊朗战争');

-- 2029.4.14 耶路撒冷文件
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file, source_section) VALUES
    (2029, 1, '2029-04-14', 1, '政治',
     '耶路撒冷文件释放',
     '旧美国政治脊柱断裂',
     '一份揭示以色列对美国军售决策影响的文件被释放；引发美国精英层信任危机；R 总统的政治崛起从此刻开始',
     '某记者获得的爆料；揭露美以"特殊关系"的细节',
     '由中俄水下助推的精确信息释放；选择 4 月 14 日是因为关注度最大化',
     1, 2, 3, 3, 3, 5, 1, 1, 5, '华盛顿 / 耶路撒冷',
     '04-old-america-death.md', '#二2029-耶路撒冷文件');

-- 2029.4.14 夜 北京识别"那道缝"
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2029, 1, '2029-04-14', 1, '拉格朗日共识',
     '北京识别"那道缝"',
     '中国战略机遇期开启的隐秘起点',
     '耶路撒冷文件释放当夜，中国最高决策层识别到"美国出现的结构性裂缝"；开始 6 年准备',
     '（无公开版本）',
     '中央高层连夜分析，确认这是百年一遇的窗口；启动多线协调',
     1, 4, 3, 5, 1, 1, 5, '北京中南海',
     '04-old-america-death.md');

-- 2030 R 总统当选
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2030, 2, '2030-11-05', 1, '政治',
     'R 总统当选',
     '"清除华盛顿的外国影响"运动启动',
     'R 总统以 51% 微弱优势获胜；承诺清除美国外国影响；主要因为耶路撒冷文件后是少数没有"以色列关系"的高级政客',
     '美国民意觉醒，清除外国影响',
     'R 真心相信使命；但 R 自己不知道这正是为新秩序铺路',
     0, 1, 3, 3, 3, 5, 1, 1, 5, '美国（白宫）',
     '人物档案/R-总统（反以色列总统）.md');

-- 2030-2034 以色列连锁崩溃
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_tier2_allies, affects_global, importance, is_time_anchor, narrative_value, physical_location, source_md_file) VALUES
    (2034, NULL, NULL, 1, '政治',
     '以色列连锁崩溃完成',
     '寡头瓦解 → 美国民众意外获益',
     '2030-2034 以色列连锁崩溃（中俄水下助推但不明面）；以色列正式失去"地区强权"地位；部分美国巨头/寡头深度绑定以色列军工，资产组合崩溃；美国军事工业重组开始；意外副作用：美国民众脱离寡头资产捆绑',
     '以色列因为美国援助断绝而衰退',
     '中俄水下精确助推（武器流通、情报操作）；美国民众通过"寡头资产崩溃"意外获得部分财富再分配',
     1, 2, 3, 3, 2, 3, 4, 1, 4, '中东',
     '04-old-america-death.md');

-- 2032.11.8 Helion 商业聚变并网
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_cn_livelihood, affects_us_livelihood, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2032, 2, '2032-11-08', 1, '科技',
     'Helion 商业聚变并网',
     '石油美元判决书签下',
     '世界第一个商业聚变发电站并网；标志石油美元体系判决书在那一夜签下；但聚变本身没有自动解放人类——关键在于聚变是"集中"还是"分布"',
     '人类能源新纪元',
     '能源革命发生，但 G2 体系将其"集中化"——这是后来"禁止聚变小型化公约"的起点',
     0, 1, 3, 3, 2, 2, 3, 5, 1, 1, 5, 'Helion 设施 / 美国',
     '09-fusion-timeline.md');

-- 2032-2034 聚变美元尝试失败
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_global, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2034, NULL, NULL, 1, '经济',
     '"聚变美元"尝试失败',
     '美国手中再无牌可打',
     '2032-2034 美国试图把美元重新锚定到聚变能源能力上；但因美国工业速度太慢（聚变堆建设、电网升级）而失败；旧锚（石油）已死，新锚（聚变）建立太慢',
     '美国工业转型遇到挑战',
     '美国精英层意识到独立挽救美元的窗口已关闭——必须接受外部援助',
     1, 2, 3, 3, 3, 4, 1, 3, '04-old-america-death.md');

-- 2033-2034 多米诺骨牌
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_tier1_russia, affects_tier2_allies, affects_global, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2034, NULL, NULL, 1, '经济',
     '多米诺骨牌：抛售美元',
     '缓慢窒息',
     '沙特、俄罗斯、欧盟陆续抛售美元储备；美元"缓慢窒息"开始；这一过程让美国高层意识到独立挽救已不可能',
     '美元储备多元化',
     '协调好的精确抛售节奏——不是恐慌，是受 G2 萌芽期早期协调的有节制行为',
     1, 2, 3, 3, 2, 2, 3, 4, 1, 3, '04-old-america-death.md');

-- 2035.4 美元危机 + 中国 2.4 万亿救援
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_cn_livelihood, affects_us_livelihood, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2035, 1, '2035-04', 1, '经济',
     '美元危机 + 中国 2.4 万亿美元救援',
     '旧美国灵魂之死',
     '美元危机爆发；中国在 36 小时内注入 2.4 万亿美元；这是"人类历史上最值钱的一笔投资"——不是控制美国，而是与美国精英建立清醒的相互信任',
     '人民币-美元货币互换协议（紧急流动性救援）',
     '金额、时间、条件都是预先沟通好的；R 总统已不在白宫；继任者打那个电话是被"安排好的"——但电话内容确实是真诚的',
     1, 2, 3, 3, 3, 3, 3, 5, 1, 1, 5, '北京 / 华盛顿',
     '04-old-america-death.md');

-- ============================================================================
-- 事实：G2 萌芽期 + 拉格朗日共识形成
-- ============================================================================

-- 2036 第一次正式拉格朗日共识
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2036, NULL, NULL, 2, '拉格朗日共识',
     '第一次正式拉格朗日共识',
     'G2 秘密治理诞生',
     '中美最高层在临时设施第一次正式形成"拉格朗日共识"——永远表演对抗，让盟友自愿付钱；约 10-12 人核心层；故意决定"不建立任何组织"',
     '（无公开版本）',
     '"如果我们建一个机构，任何不满的员工都能毁掉一切。我们不要任何这些。我们继续做自己的工作——我们只是私下知道彼此的真正想法。G2 永远不存在。"',
     1, 4, 3, 3, 3, 5, 1, 1, 5, '某临时设施（瑞士？太空？）',
     '拉格朗日共识/machinery.md');

-- 2035-2045 多极货币时代（幻觉）
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_global, affects_tier2_allies, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2040, NULL, NULL, 2, '经济',
     '"多极货币时代"',
     '过渡期幻觉',
     '表面"多极货币时代"——欧元、日元、人民币、卢布、英镑各自寻求区域影响力；但其实是 2036 共识达成后的过渡期幻觉',
     '货币多极化是全球化的自然演化',
     '中美早已秘密达成共识，盟友的"多极幻觉"恰恰是 G2 收钱机制——盟友自愿"贴钱"以为自己能"再多做一点就赢"',
     1, 2, 3, 3, 4, 1, 3, '经济/timeline.md');

-- ============================================================================
-- 事实：PSA 诞生与 G2 第一次主动合谋
-- ============================================================================

-- 2046 田中健太发明 PSA
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_tier2_allies, affects_lunar_industry, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2046, NULL, NULL, 3, '科技',
     '日本田中健太博士发明 PSA 母技术',
     '为防御地震而发明的，被武器化',
     '田中健太博士（日本东京大学）发明"智能建筑材料"；动机是防御地震；自己不知道发明了什么级别的技术；中美情报系统几乎同时识别军事潜力',
     '日本-韩国新型抗震建筑材料突破',
     '相位转移材料的早期版本——后来发展为 PSA；田中本人完全不知道；2046-2050 间日本科技因为"被卖出"开始永久衰退',
     1, 2, 2, 2, 3, 3, 5, 1, 1, 5, '东京大学',
     '人物档案/田中健太（PSA 之父）.md');

-- 2047.1 8 分钟密会
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_tier2_allies, affects_lunar_industry, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2047, 1, '2047-01', 3, '拉格朗日共识',
     '拉格朗日宫殿 8 分钟密会',
     'G2 信任系统的物质起点；70 年盾矛分工的工业血管',
     '中美最高层在 Lagrange Palace 用 8 分钟确定 PSA 收购方案：通过新加坡 + 瑞士中介的"合法走私渠道"；70% 价格 + 10% 永久技术分成 + 30-50 年人情',
     '（无公开版本）',
     '日本/韩国"卖了好价格"——但完全不知道自己卖的是什么级别的技术；这是 G2 第一次主动合谋的代价由"被合作的第三方"承担',
     1, 4, 3, 3, 3, 3, 5, 1, 1, 5, 'Lagrange Palace L5',
     '11-phase-shift-armor.md');

-- ============================================================================
-- 事实：经济与民生改革（2050s）
-- ============================================================================

-- 2052 第一批 LBT
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_us_livelihood, affects_lunar_industry, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2052, NULL, NULL, 3, '经济',
     '第一批月球支持债券（LBT）发行',
     '美债开始锚定月球资产',
     '美国财政部第一次发行月球支持债券（Lunar-Backed Treasuries）；让美债从"信用债券"变成"资产支持债券"；中国是最大持有方',
     '新型创新主权债券',
     '中美秘密协调下的双重支持：美国发行，中国保障流动性；锚定的"月球资产"实际是中美共有的',
     1, 2, 3, 3, 2, 3, 4, 1, 3, '经济/us-debt-anchoring.md');

-- 2050s 中国 35 小时工作周
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_cn_livelihood, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2055, NULL, NULL, 3, '民生',
     '中国 35 小时工作周成为大城市标准',
     '996 被消除；中国进入"北欧生活方式"',
     '北上广深及一线城市强制 35 小时工作周；996 工作模式被立法消除；主要物质基础是军费的 35-45% 回流民生 + 月球工业生产力红利',
     '中国劳动法改革',
     '资金来源是 G2 体系下的军费回流（"军费"实际是月球开采基础设施费）',
     1, 1, 3, 3, 5, 1, 4, '民生/timeline.md');

-- 2050s 美国基础医疗半公共化
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2058, NULL, NULL, 3, '民生',
     '美国基础医疗成为半公共服务',
     '医疗破产基本消失',
     '美国基础医疗（急诊、慢病管理、儿童健康）成为半公共服务；医疗破产从美国家庭破产首位原因变得罕见；主要资金来源：军费的 30-40% 强制公共服务投入',
     '美国民主党推动的医保扩张',
     '2058《政治献金净化法》后军工企业禁止竞选资助，原本的游说预算被强制转入公共服务',
     1, 2, 2, 3, 4, 1, 3, '民生/timeline.md');

-- 2055 红线条约 + 盾矛分工正式确立
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_lunar_industry, affects_global, importance, is_time_anchor, is_watershed, narrative_value, source_md_file) VALUES
    (2055, NULL, NULL, 3, '军事',
     '《红线条约》签署 + 盾矛分工正式确立',
     'G2 在物质层面的"婚约"',
     '中国主导盾（PSA、装甲卫星、装甲潜艇），美国主导矛（定向能武器、超高速动能、太空打击）；任何一方退出体系都瘫痪',
     '关键基础设施互保协议',
     '盾矛分工是 G2 互锁机制的物质基础；表面上是军事条约，实际是政治"婚约"',
     1, 2, 3, 3, 3, 3, 5, 1, 1, 4, '军事/timeline.md');

-- 2055-2068 立法浪潮
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_cn_livelihood, affects_us_livelihood, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2065, NULL, NULL, 3, '政治',
     '军工复合体法律强约束立法浪潮',
     '政治阉割了军工',
     '美国：禁止竞选资助、关旋转门、强制公共服务投入、设立 OMIC；中国：禁止以外部威胁论证预算、强制民用衍生、家庭利益申报严苛',
     '反腐 + 公共信任重建立法',
     '中美都在事实上消解了 20 世纪那种"军工绑架政治"的反向影响力；军工成为纯粹的执行工具',
     0, 1, 3, 3, 3, 3, 5, 1, 4, '军事/timeline.md');

-- 2058 文明代差顿悟
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2058, NULL, NULL, 3, '拉格朗日共识',
     '拉格朗日宫殿"文明代差顿悟"',
     'G2 进入"两个文明合体"阶段',
     'Davidson 与魏的对话；美方意识到中国政治传统 2000 年领先；中方承认西方技术领先（基于资本主义+Nash 均衡）；"我以为我们是大人，他们是孩子。原来我们都是孩子——只是在不同的课堂里"',
     '（无公开版本）',
     '这是 G2 体系最深的认知转折——从"两个国家合作"升级为"两个文明合体"；之后的所有决策都带着这种"清醒的对等"',
     1, 4, 3, 3, 5, 1, 1, 5, 'Lagrange Palace L5',
     '拉格朗日共识/machinery.md#九文明代差');

-- 2061 第一批 SBT
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, affects_lunar_industry, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2061, NULL, NULL, 3, '经济',
     '第一批装甲卫星支持债券（SBT）发行',
     '美债"双重锚定"：月球+卫星',
     '美国财政部发行装甲卫星支持债券；与 LBT 互补，让美债的资产支持范围扩大到太空轨道资产',
     '太空基础设施融资创新',
     '中美继续协调下的债务体系演化；锚定的卫星实际是 G2 共有的',
     1, 2, 3, 2, 2, 3, 1, 2, '经济/us-debt-anchoring.md');

-- 2068 禁止聚变小型化国际公约
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_global, affects_underwater, importance, is_time_anchor, is_watershed, narrative_value, source_md_file) VALUES
    (2068, NULL, NULL, 4, '拉格朗日共识',
     '《禁止聚变小型化国际公约》',
     '拉格朗日共识禁忌成文',
     '禁止任何国家研发小型聚变堆；同时秘密决定"必须有外包研究方案"——深蓝项目的种子',
     '防止核扩散与聚变武器化',
     '禁忌的真实理由：保持聚变集中化是 G2 收钱机制的物质基础；同时秘密外包研究——后来的反抗源头',
     1, 1, 3, 3, 3, 3, 5, 1, 1, 4, '08-fusion-suppression.md');

-- 2068《重建公共信任法》
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_us_livelihood, importance, is_time_anchor, narrative_value, source_md_file) VALUES
    (2068, NULL, NULL, 4, '政治',
     '《重建公共信任法》（美国）',
     'K Street 军工游说生态被消解',
     '集大成的反军工立法——军费必须有强制公共服务投入比例；不能通过基金会-中介稀释；K Street 军工游说生态在 2070 年代彻底灭绝',
     '反腐与公共信任重建',
     '是 2055-2068 立法浪潮的最后一锤；让军工综合体彻底失去对美国政治的反向影响',
     0, 1, 3, 3, 4, 1, 3, '军事/timeline.md');

-- ============================================================================
-- 事实：反抗萌芽
-- ============================================================================

-- 2080 深蓝项目立项
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_underwater, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2080, NULL, NULL, 5, '军事',
     '深蓝项目秘密立项（装甲潜艇都市）',
     '研究外包开始',
     '拉格朗日共识秘密决定外包关键研究（包括聚变小型化）到装甲潜艇都市；这是"反抗的种子"——研究队伍后来觉醒',
     '（无公开版本）',
     '初衷是绕开《禁止聚变小型化公约》的形式约束；意外副作用：建立了一个"无法追踪"的研究社区',
     1, 4, 3, 3, 3, 5, 1, 1, 4, '太平洋深处',
     '军事/timeline.md');

-- 2093 普罗米修斯事故
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_lunar_industry, affects_lunar_population, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2093, NULL, NULL, 5, '军事',
     '普罗米修斯月球基地"事故"',
     '拉格朗日共识内部派系冲突',
     '月球普罗米修斯研究基地遭遇严重"事故"；公开归咎于自然灾害；实际是拉格朗日共识某派系发动奇袭，被反制；数千人死亡或失踪',
     '月球研究基地事故；自然灾害',
     'G2 内部派系（聚变小型化派 vs 反对派）的"准内战"；月球工业联盟开始觉醒，意识到自己被使用',
     1, 3, 3, 3, 3, 3, 5, 1, 1, 5, '月球普罗米修斯基地',
     '军事/timeline.md');

-- ============================================================================
-- 事实：汇聚日
-- ============================================================================

-- 2125.5 汇聚日
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_us_politics, affects_cn_livelihood, affects_us_livelihood, affects_lunar_industry, affects_lunar_population, affects_underwater, affects_global, importance, is_time_anchor, is_watershed, narrative_value, physical_location, source_md_file) VALUES
    (2125, 1, '2125-05', 7, '拉格朗日共识',
     '汇聚日：月球独立 + 装甲潜艇上浮',
     'G2 体系正式破裂',
     '月球工业联盟宣布独立 + 装甲潜艇都市同时上浮；两个"被外包出去的反抗"在同一日合流；G2 共治体系正式破裂；林安然作为关键目击者',
     '突发的月球危机 + 海洋"未知现象"',
     '90 年间秘密外包出去的两个"研究社区"在 2125 年同时觉醒；他们之间事先有协调（通过装甲潜艇-月球的工业链）',
     1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 5, 1, 1, 5, '月球 + 太平洋',
     'timeline.md');

-- ============================================================================
-- 事实：人物（典型反对者案例）
-- ============================================================================

-- Mark Chen（推恩令式吸纳）
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, importance, narrative_value, source_md_file) VALUES
    (2059, NULL, NULL, 3, '人物',
     'Mark Chen 案例（推恩令式吸纳）',
     '反对者类型 5 第 1 级：吸纳',
     'Mark Chen 开始整理"GFSSC 决策实际由中美预先决定"的内部备忘录；3 周内收到 Brookings 一份高级研究员 offer，年薪三倍；他接受了；10 年后他依然在 Brookings 写"GFSSC 改革建议"——真心相信自己在做有意义的工作',
     '一位有为的政策研究者获得高级智库职位',
     '推恩令机制——让反对者成为体系的"内部分析者"，内化反抗的能量',
     0, 2, 2, 4, 5, '人物档案/反对者档案-披露真相的人.md');

-- 2105 美军研究员"心脏病"
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_us_politics, affects_underwater, importance, narrative_value, source_md_file) VALUES
    (2105, NULL, NULL, 6, '人物',
     '2105 美军研究员"心脏病"',
     '可能的物理手段使用（疑案）',
     '某美国军方研究员知道"装甲潜艇都市"的存在，准备公开——突发心脏病死亡，48 岁；G2 内部至今争议；如果属实是 90 年来唯一一次（疑似）使用物理手段；2106 年拉格朗日共识内部会议重申纪律："物理手段绝对禁止"',
     '突发心脏病自然死亡',
     '可能是某未授权下层操作；决策层事后并不认可；这件事让 G2 重申纪律',
     1, 4, 2, 3, 4, 5, '人物档案/反对者档案-披露真相的人.md');

-- ============================================================================
-- 事实：月壤 / 月球工业（关键里程碑）
-- ============================================================================

-- 2027 嫦娥 7 测算氦三储量
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_cn_politics, affects_lunar_industry, affects_global, importance, narrative_value, physical_location, source_md_file) VALUES
    (2027, NULL, NULL, 1, '月壤',
     '嫦娥-7 月球南极探测任务成功',
     '氦三储量被精确测算',
     '中国深空探测嫦娥-7 完成月球南极氦三测算；中国某科学家半夜的电话："我们要重新定义人类未来。"',
     '中国月球科考成果',
     '中方此时已识别月球氦三的战略价值——为后来的月球工业链奠定基础',
     0, 1, 3, 3, 2, 4, 4, '月球南极',
     '月壤/timeline.md');

-- 2125 月球独立（与汇聚日同步，但作为月壤独立维度）
INSERT INTO facts (year, half, specific_date, era_id, domain, title, summary, details, public_narrative, actual_truth, has_public_lie, visibility_level, affects_lunar_industry, affects_lunar_population, affects_global, importance, is_time_anchor, is_watershed, narrative_value, source_md_file) VALUES
    (2125, 1, '2125-05', 7, '月球工业',
     '月球工业联盟宣布独立',
     '月生代主导',
     '月球工业联盟正式宣布脱离地球控制；月生代第二代是主力；食物自给率达到 85%（独立门槛）；与装甲潜艇都市同时行动',
     '月球危机',
     '月生代意识到自己被使用——盾矛分工的真实物质基础是月球开采，他们才是真正的工人；"汇聚日"的月球侧',
     1, 1, 3, 3, 3, 5, 1, 1, 5, '月壤/timeline.md');

-- ============================================================================
-- 关键因果链
-- ============================================================================

-- 伊朗战争 → 耶路撒冷文件
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '伊朗战争（"史诗愤怒行动"）'),
    (SELECT id FROM facts WHERE title = '耶路撒冷文件释放'),
    'enables',
    '伊朗战争 137 名美军死亡让公众愿意接受耶路撒冷文件的爆炸性内容';

-- 耶路撒冷文件 → 北京识别"那道缝"
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '耶路撒冷文件释放'),
    (SELECT id FROM facts WHERE title = '北京识别"那道缝"'),
    'triggers',
    '北京最高决策层在文件释放当夜识别窗口';

-- 耶路撒冷文件 → R 总统当选
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '耶路撒冷文件释放'),
    (SELECT id FROM facts WHERE title = 'R 总统当选'),
    'enables',
    '文件让"清白候选人"R 在 2030 年获得历史性窗口';

-- R 总统 → 聚变美元失败
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = 'R 总统当选'),
    (SELECT id FROM facts WHERE title = '"聚变美元"尝试失败'),
    'amplifies',
    'R 摧毁了美国对外政策机构，也无意中摧毁了应对危机的能力';

-- Helion 并网 → 多米诺骨牌
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = 'Helion 商业聚变并网'),
    (SELECT id FROM facts WHERE title = '多米诺骨牌：抛售美元'),
    'triggers',
    '聚变并网让石油美元死亡判决书签下，盟友开始抛售';

-- 多米诺 → 美元危机救援
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '多米诺骨牌：抛售美元'),
    (SELECT id FROM facts WHERE title = '美元危机 + 中国 2.4 万亿美元救援'),
    'culminates_in',
    '抛售压力最终导致 2035.4 危机';

-- 美元救援 → 拉格朗日共识
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美元危机 + 中国 2.4 万亿美元救援'),
    (SELECT id FROM facts WHERE title = '第一次正式拉格朗日共识'),
    'direct_cause',
    '救援后 1 年内中美建立秘密协调机制';

-- 田中健太 PSA → 8 分钟密会
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '日本田中健太博士发明 PSA 母技术'),
    (SELECT id FROM facts WHERE title = '拉格朗日宫殿 8 分钟密会'),
    'triggers',
    '田中发明被中美情报系统识别后，G2 第一次主动合谋收购';

-- 8 分钟密会 → 红线条约盾矛分工
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '拉格朗日宫殿 8 分钟密会'),
    (SELECT id FROM facts WHERE title = '《红线条约》签署 + 盾矛分工正式确立'),
    'enables',
    'PSA 通道是盾矛分工的工业血管';

-- 红线条约 → 立法浪潮
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《红线条约》签署 + 盾矛分工正式确立'),
    (SELECT id FROM facts WHERE title = '军工复合体法律强约束立法浪潮'),
    'enables',
    '盾矛分工确立后，必须用法律阉割军工政治权力';

-- 立法 → 中国 35 小时工作周
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '军工复合体法律强约束立法浪潮'),
    (SELECT id FROM facts WHERE title = '中国 35 小时工作周成为大城市标准'),
    'enables',
    '军费回流民生是 35 小时工作周的物质基础';

-- 立法 → 美国基础医疗
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '军工复合体法律强约束立法浪潮'),
    (SELECT id FROM facts WHERE title = '美国基础医疗成为半公共服务'),
    'enables',
    '美国侧立法浪潮强制公共服务投入';

-- 禁止小型化 → 深蓝项目
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《禁止聚变小型化国际公约》'),
    (SELECT id FROM facts WHERE title = '深蓝项目秘密立项（装甲潜艇都市）'),
    'direct_cause',
    '禁忌成文后必须秘密外包——直接催生深蓝项目';

-- 深蓝项目 → 汇聚日
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '深蓝项目秘密立项（装甲潜艇都市）'),
    (SELECT id FROM facts WHERE title = '汇聚日：月球独立 + 装甲潜艇上浮'),
    'culminates_in',
    '外包研究 45 年后觉醒';

-- 普罗米修斯 → 汇聚日
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '普罗米修斯月球基地"事故"'),
    (SELECT id FROM facts WHERE title = '汇聚日：月球独立 + 装甲潜艇上浮'),
    'culminates_in',
    '月生代意识到自己被使用是月球独立的认知起点';

-- 田中 PSA 公开版 vs 真相
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '日本田中健太博士发明 PSA 母技术'),
    (SELECT id FROM facts WHERE title = '拉格朗日宫殿 8 分钟密会'),
    'contradicts',
    '田中本人的"为防御地震"动机与 G2 的军事化使用形成根本叙事矛盾';

-- ============================================================================
-- 事实-人物 关联
-- ============================================================================

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'decision_maker'
FROM facts f, characters c
WHERE f.title = 'R 总统当选' AND c.name = 'R 总统';

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'decision_maker'
FROM facts f, characters c
WHERE f.title = '日本田中健太博士发明 PSA 母技术' AND c.name = '田中健太';

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'decision_maker'
FROM facts f, characters c
WHERE f.title = '第一次正式拉格朗日共识' AND c.name IN ('李书记', 'Robertson 部长');

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'decision_maker'
FROM facts f, characters c
WHERE f.title = '拉格朗日宫殿 8 分钟密会' AND c.name IN ('李书记', 'Robertson 部长');

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'decision_maker'
FROM facts f, characters c
WHERE f.title = '拉格朗日宫殿"文明代差顿悟"' AND c.name IN ('Davidson', '魏');

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'POV候选'
FROM facts f, characters c
WHERE f.title = '汇聚日：月球独立 + 装甲潜艇上浮' AND c.name = '林安然';

INSERT INTO fact_characters (fact_id, character_id, role)
SELECT
    f.id,
    c.id,
    'victim'
FROM facts f, characters c
WHERE f.title = 'Mark Chen 案例（推恩令式吸纳）' AND c.name = 'Mark Chen';

-- ============================================================================
-- 标签
-- ============================================================================

INSERT INTO tags (name, description) VALUES
    ('盾矛分工',         '与盾矛分工政治架构相关'),
    ('物质秘密',         'G2 体系的物质基础设施秘密'),
    ('表演经济学',       'ROI 872 倍的对抗叙事相关'),
    ('黑调试',           '中国式软影响机制'),
    ('文明代差',         '中国 2000 年政治传统 vs 西方 200 年技术'),
    ('好人维持坏体系',   'G2 核心成员的悲剧性'),
    ('多极幻觉',         '盟友"贴钱"机制'),
    ('军费回流',         '军费的 30-45% 实际流回民生'),
    ('清醒的演员',       '军方知道是在演戏'),
    ('外包反抗',         '深蓝项目 + 月生代觉醒'),
    ('反对者处理',       '5 级阶梯不使用物理手段'),
    ('日本科技衰退',     '"被卖出"的代价由第三方承担');

-- 关联事实到标签
INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '《红线条约》签署 + 盾矛分工正式确立' AND t.name = '盾矛分工';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '《禁止聚变小型化国际公约》' AND t.name IN ('物质秘密', '盾矛分工');

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '拉格朗日宫殿"文明代差顿悟"' AND t.name = '文明代差';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '日本田中健太博士发明 PSA 母技术' AND t.name = '日本科技衰退';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '中国 35 小时工作周成为大城市标准' AND t.name = '军费回流';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '美国基础医疗成为半公共服务' AND t.name = '军费回流';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = 'Mark Chen 案例（推恩令式吸纳）' AND t.name = '反对者处理';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '深蓝项目秘密立项（装甲潜艇都市）' AND t.name = '外包反抗';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title = '汇聚日：月球独立 + 装甲潜艇上浮' AND t.name = '外包反抗';
