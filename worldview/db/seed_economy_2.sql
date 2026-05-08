-- ============================================================================
-- 经济线 - 详细半年粒度事实（第二批）
-- 时段：2051-2068（红线条约 + LBT/SBT + 立法浪潮经济维度 + 文明代差经济）
-- ============================================================================
-- 核心叙事：
--   - 经济从"危机救援"过渡到"结构性协调"
--   - LBT/SBT 让美债从"信用债券"变成"资产支持债券"
--   - 立法浪潮的经济传导：军工游说预算 → 公共服务投入
--   - 第三层国家"贴钱"机制成熟到峰值
--   - 文明代差顿悟（2058）的经济产物：中美治理学习
--
-- 来源 md 文件：
--   - 经济/timeline.md
--   - 经济/us-debt-anchoring.md
--   - 民生/timeline.md
--   - 军事/timeline.md（立法浪潮）
--   - 拉格朗日共识/machinery.md（贴钱机制）
-- ============================================================================

-- ============================================================================
-- 2051-2052 · 轨道防扩散公约 + LBT 诞生
-- ============================================================================

INSERT INTO facts (year, half, era_id, domain, title, summary, details,
    public_narrative, actual_truth, has_public_lie, visibility_level,
    affects_us_politics, affects_cn_politics, affects_us_livelihood, affects_cn_livelihood,
    affects_global, affects_lunar_industry, affects_lunar_population, affects_underwater,
    affects_tier1_russia, affects_tier2_allies, affects_tier3_developing,
    importance, narrative_value, physical_location,
    source_md_file)
VALUES
(2051, 1, 3, '经济',
 '《轨道防扩散公约》谈判的经济维度',
 '装甲卫星市场被 G2 垄断',
 '2051 年上半年《轨道防扩散公约》谈判中，G2 主导的"轨道防扩散"框架本质上是经济垄断框架——所有非 G2 国家被排除在 PSA 装甲卫星部署权之外。市场分析师估算：装甲卫星全球市场规模约 1.2 万亿美元，G2 占据 95%。',
 '太空军备控制谈判',
 'G2 把"安全"叙事转化为"经济垄断"——这是表演经济学的最高级形式',
 1, 2,
 3, 3, 1, 1, 3, 0, 0, 0, 1, 3, 3,
 4, 3, '日内瓦',
 '军事/timeline.md'),

(2051, 2, 3, '经济',
 '盟友"轨道服务费"机制启动',
 '日韩英德澳每年付费 200 亿美元购买"装甲卫星保护"',
 '2051 年下半年公约签署后，盟友的"轨道服务费"机制启动——日韩英德澳每年付费 200 亿美元给 G2，用于"装甲卫星保护"。这是"贴钱"机制最直接的物质表现：盟友为自己不需要的服务付钱，因为不付钱就被认为是"不安全"。',
 '盟友对国际安全的贡献',
 '是"多极幻觉"机制的经济具象化——盟友自愿付钱给 G2 维持"安全"，但他们其实是用自己的钱让 G2 更稳固',
 1, 2,
 3, 3, 0, 0, 1, 0, 0, 0, 0, 3, 1,
 4, 3, '全球第二、三层国家',
 '拉格朗日共识/machinery.md#二多极世界的幻觉'),

(2052, 1, 3, '经济',
 '第一批月球支持债券（LBT）正式发行',
 '美债从"信用债券"变成"资产支持债券"',
 '2052 年上半年美国财政部发行第一批月球支持债券（LBT）。规模 4000 亿美元。锚定资产：氦三储量（10000 吨估值）+ 月轨工厂收益权 + 月球矿物开采权。利率比常规美债低 80 个基点——市场买单。',
 '创新型主权融资工具',
 '"美国资产"实际是中美共有的——这是经济线的核心物质秘密；中国是最大单一买家',
 1, 2,
 3, 3, 1, 1, 3, 3, 0, 0, 1, 1, 1,
 5, 3, '华盛顿',
 '经济/us-debt-anchoring.md'),

(2052, 2, 3, '经济',
 'LBT 市场反应：超额认购 3 倍',
 '中国央行成最大单一买家',
 '2052 年下半年 LBT 在二级市场被疯抢——超额认购 3 倍。中国央行成最大单一买家（购买 1200 亿美元）。表面看是"中国对美国债券的信心"。实际是 G2 协调下的双重支持：美国发行，中国保障流动性。',
 '中国对美债的信心',
 'G2 在 LBT 上的协调让美国债务问题被"创造性解决"——而中国获得对月球工业的间接控制权',
 1, 3,
 3, 3, 1, 1, 1, 3, 0, 0, 0, 1, 1,
 4, 3, '全球债券市场',
 '经济/us-debt-anchoring.md'),

-- ============================================================================
-- 2053-2054 · 测试性战争经济效应
-- ============================================================================

(2053, 1, 3, '经济',
 '第一次"测试性战争"经济效应',
 '军工股 + 装甲材料股小幅上涨',
 '2053 年上半年东南亚"测试性战争"启动后的经济效应：美国洛马、雷神股价上涨 8%；中国军工股上涨 6%；PSA 装甲材料相关公司股价上涨 12%。但宏观经济基本不受影响——战争成本被精确控制在"产品发布会"规模。',
 '地区冲突的市场反应',
 '"可持续战争"模式的经济精髓——战争规模和经济影响都被精确管理，让市场不真正恐慌',
 1, 4,
 3, 3, 0, 0, 1, 0, 0, 0, 0, 1, 0,
 4, 3, '全球军工股',
 '军事/timeline.md'),

(2053, 2, 3, '经济',
 '中美研究人员"互访"政策的经济激励',
 '研究员年薪可翻 3 倍',
 '2053 年下半年中美启动"研究人员互访"政策的经济维度：被互访的研究员年薪可翻 3 倍（从 8 万到 24 万美元）。这种经济激励是 G2 在关键技术领域精确分工的物质工具——被选中的研究员"恰好"研究方向调整。',
 '国际科研合作的经济激励',
 '黑调试机制在科研领域的具体表现——通过经济红利让"知情派"研究员配合分工调整',
 1, 3,
 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1,
 3, 2, '北京 / 华盛顿',
 '06-soft-influence.md'),

(2054, 1, 3, '经济',
 '装甲潜艇人员长寿命研究的经济投入',
 '中美各 50 亿美元年度研究预算',
 '2054 年上半年"装甲潜艇人员长寿命研究"启动的经济投入：中美各拨款 50 亿美元/年。表面是医学研究。实际：是为后来 2080 年深蓝项目装甲潜艇都市做的医学预备。这种"民用研究"经费让 G2 可以在不引起军事审查的情况下完成研究。',
 '极端环境医学研究投入',
 '"民用预算"是 G2 绕开 OMIC 审查（虽然此时 OMIC 还未成立）的物质工具',
 1, 3,
 3, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0,
 3, 2, '中美研究中心',
 '军事/timeline.md'),

(2054, 2, 3, '经济',
 '美元-人民币体系的"双层运作"成熟',
 '在 G2 内部用人民币，对第三方用美元',
 '2054 年下半年美元-人民币双层运作机制成熟：G2 内部交易（中美直接贸易、月球工业链、装甲化技术贸易）大量使用人民币结算（约 60%）；对第三方国家继续使用美元主导（约 80%）。这种双层运作让美元的"全球地位"叙事维持，同时人民币在关键 G2 内部交易中地位上升。',
 '货币使用的国际多元化',
 '是 G2 隐秘的"双货币"体系——表面美元仍是世界货币，实际 G2 核心交易已经是人民币',
 1, 3,
 3, 3, 1, 1, 3, 0, 0, 0, 1, 1, 1,
 5, 3, '全球结算系统',
 '经济/timeline.md'),

-- ============================================================================
-- 2055 · 红线条约经济维度 + 立法浪潮启动
-- ============================================================================

(2055, 1, 3, '经济',
 '《红线条约》谈判的经济条款',
 '盾矛分工的"利润对称"机制',
 '2055 年上半年《红线条约》谈判中的经济条款：盾矛分工带来"利润对称"——中国从盾（PSA、装甲卫星、装甲潜艇）的工业利润中获益；美国从矛（定向能、超高速动能、太空打击）的技术分成（10% 永久分成）中获益。每一笔交易双方都赚钱。',
 '关键基础设施互保协议',
 '"利润对称"是 G2 70 年信任的经济基石——双方在每笔交易中都赚钱，所以没有动机背叛',
 1, 4,
 3, 3, 1, 1, 2, 1, 0, 0, 0, 0, 0,
 5, 4, 'Lagrange Palace L5',
 '军事/timeline.md'),

(2055, 1, 3, '经济',
 '中国"军民融合 2.0"的经济结构改革',
 '军工预算改革 KPI：必须有民生贡献',
 '2055 年上半年中国"军民融合 2.0"的经济结构改革：军工企业的预算论证规则改变——50% 以上的预算必须有可量化的"民生贡献度"。例如 PSA 项目必须证明对抗震建筑的贡献；定向能项目必须证明对工业激光的贡献。',
 '军民融合改革深化',
 '是中国"军费回流民生"机制的法律起点——不能再以"对外威胁"作为预算主理由',
 0, 1,
 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0,
 4, 3, '北京',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2055, 2, 3, '经济',
 '《红线条约》签署经济震荡',
 '军工股两极分化',
 '2055 年下半年《红线条约》签署的市场反应：明确"知情"军工股（与盾或矛分工有关的公司）股价上涨 15-20%；不知情或被分工"挤出"的军工股下跌 20-30%。这种两极分化反映了 G2 对军工产业的"精确选择"——只有少数公司被纳入分工。',
 '《红线条约》的市场反应',
 '"两极分化"是经济版的"知情派 vs 不知情者"——经济红利精确给到 G2 选定的公司',
 1, 3,
 3, 3, 1, 0, 1, 0, 0, 0, 0, 1, 0,
 4, 3, '全球军工股',
 '军事/timeline.md'),

(2055, 2, 3, '经济',
 '美国《国防采购透明法》起草的经济影响',
 'K 街军工游说团准备反弹',
 '2055 年下半年《国防采购透明法》起草。K 街军工游说团准备 70 年来最大规模的反弹——准备投入约 500 亿美元的"政治献金"和"游说预算"试图阻止法案。但他们不知道：拉格朗日共识已经在背后悄悄"调节"游说预算的有效性。',
 '军工游说团反对透明法',
 '"500 亿反弹"成为后来"立法浪潮的经济成本"基准——这些钱被精确稀释到无效',
 1, 3,
 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 4, 3, '华盛顿 K 街',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

-- ============================================================================
-- 2056-2057 · 立法浪潮第一波 + GFSSC 成立
-- ============================================================================

(2056, 1, 3, '经济',
 '《国防采购透明法》提交国会经济维度',
 '军工股下跌 8%',
 '2056 年上半年法案提交国会的市场反应：美国大型军工企业股价下跌 8%；防务领域 ETF 下跌 12%。但这种下跌被精确管理——拉格朗日共识让"知情"投资者提前减仓，让冲击温和；而"不知情"的中小投资者承担了下跌成本。',
 '法案提交后的市场反应',
 '"提前减仓"机制是黑调试的经济维度——精确选择谁承担市场震荡',
 1, 3,
 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
 3, 2, '美国股市',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2056, 2, 3, '经济',
 '《国防采购透明法》通过 + 50 万美元合同公开',
 '军工产业链信息透明化',
 '2056 年下半年《国防采购透明法》通过。50 万美元以上的合同强制公开。结果：军工合同的"加价空间"被压缩 40-60%；许多原本合理的合同因"程序透明"问题被取消；K 街游说团第一次真正意识到"自己的资金路径在被切断"。',
 '反腐立法的成功落地',
 '"加价空间被压缩"是军费"过剩"现象的经济起点——以前给军工公司的"加价"现在被强制透明化',
 0, 1,
 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
 4, 3, '美国军工产业',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2057, 1, 3, '经济',
 'GFSSC 成立的经济意义',
 '聚变能源贸易标准国际化',
 '2057 年上半年 GFSSC（全球聚变安全标准委员会）成立的经济意义：所有国际聚变能源贸易必须经过 GFSSC 认证。这让聚变能源市场规模（约 4 万亿美元/年）的国际贸易完全在 G2 控制下。第二、三层国家被纳入 GFSSC 治理结构——但实际决策权 G2 主导。',
 '聚变能源国际治理',
 '是 G2 把聚变集中化经济利益国际法化的关键——4 万亿美元市场被 G2 永久锁定',
 1, 2,
 3, 3, 1, 1, 3, 1, 0, 0, 1, 3, 3,
 5, 3, '日内瓦',
 '08-fusion-suppression.md'),

(2057, 2, 3, '经济',
 '中国"为民服务"KPI 全面落地的经济影响',
 '军工预算结构性调整：30% 流向民生',
 '2057 年下半年中国"为民服务"KPI 全面落地的经济影响：军工企业的实际经济产出中，约 30% 被归类为"民生贡献"（民用衍生技术、城市基础设施等）。这是中国"军费回流民生"机制的物质起点。',
 '军民融合改革的经济成果',
 '是 2058 年中国基础医疗扩展、35 小时工作周等"民众红利"的资金路径',
 0, 2,
 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0,
 4, 3, '中国军工产业',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

-- ============================================================================
-- 2058 · 文明代差顿悟的经济维度 + 政治献金净化
-- ============================================================================

(2058, 1, 3, '经济',
 '《政治献金净化法》立法的经济震荡',
 'K 街军工游说预算大规模"无路可走"',
 '2058 年上半年《政治献金净化法》立法启动。军工企业禁止任何形式的竞选资助。结果：原本预算约 300 亿美元/年的军工政治献金资金"无路可走"。一部分被强制转入公共服务投入比例（基础医疗、社区教育、退伍军人住房），一部分被以"合规化"形式进入 OMIC（2065 成立）。',
 '反腐立法的下一步',
 '是"军费回流民生"的物质起点——300 亿美元/年的资金流向从"政治献金"变成"公共服务"',
 1, 1,
 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0,
 5, 3, '华盛顿',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2058, 1, 3, '经济',
 '美国基础医疗"半公共化"政治推动期 + 资金到位',
 '军工游说预算的"重新分配"',
 '2058 年上半年美国基础医疗"半公共化"立法获得"突然"的资金支持——原本无法解决的 8000 亿美元/年资金缺口"恰好"通过《政治献金净化法》后军工公共服务投入比例填补。这是物质上的"军费回流民生"——但叙事上是"反腐 + 医保"。',
 '医保扩张运动',
 '资金的真实路径："军工游说"→"政治献金净化法"→"公共服务投入"→"基础医疗"——每一步都合法，但整体是 G2 共识下精心设计的物质重新分配',
 1, 2,
 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0,
 5, 3, '华盛顿',
 '民生/timeline.md'),

(2058, 2, 3, '经济',
 '文明代差顿悟的经济产物',
 '"美方学习中方治理艺术"的物质应用',
 '2058 年下半年 Davidson 顿悟后的经济维度产物——美方开始系统性学习中方"治理"的物质工具。具体应用：美方采用类似中国"军民融合"的预算论证规则；美方学习中国"长期国家投资"的耐心（不再追求季度回报）；美方在月球工业领域开始接受"30 年回收期"的项目（之前美国资本主义难以接受）。',
 '（无公开版本）',
 '是文明代差顿悟在经济政策上的具体物质应用——美方"gover"动作的强化',
 1, 4,
 3, 3, 1, 0, 0, 1, 0, 0, 0, 0, 0,
 4, 4, '华盛顿',
 '拉格朗日共识/machinery.md#九文明代差'),

(2058, 2, 3, '经济',
 '《政治献金净化法》通过经济效应',
 'K 街军工游说生态资金流入彻底切断',
 '2058 年下半年法案通过的经济效应：原本 K 街军工游说生态的 300 亿美元/年"政治献金资金路径"彻底切断。游说团成员开始大规模转行——一部分进入军工合规岗位（OMIC 前身），一部分进入智库（"系统改革者"路径），一部分彻底转行。',
 '游说政治的衰退',
 '是 K 街生态消解的经济基础——12 年后（2070）整个生态彻底灭绝',
 1, 1,
 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 4, 3, '华盛顿 K 街',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

-- ============================================================================
-- 2059-2060 · 测试性战争扩展 + K 街萎缩
-- ============================================================================

(2059, NULL, 3, '经济',
 '黑调试机制的"经济补偿"成为常态',
 '"知情派"在每次政策变动中获益',
 '2059 年起黑调试机制的"经济补偿"成为体系运行常态——每次重大政策变动（立法浪潮、贸易调整、技术分工）前，"知情派"都能提前获得经济信号。这种"信息红利"让 G2 体系周边的"操作层"和"执行层"持续受益。',
 '（无公开版本）',
 '是 G2 体系最隐秘的经济维度——通过经济补偿确保中层官员的忠诚',
 1, 4,
 3, 3, 1, 1, 0, 0, 0, 0, 0, 1, 0,
 4, 3, '中美各行业',
 '06-soft-influence.md'),

(2060, 1, 3, '经济',
 '第二次代理人战争经济效应',
 '萨赫勒、中亚同步军费"消耗"',
 '2060 年上半年第二次代理人战争启动。萨赫勒和中亚同步成为"测试场"。两个战场年度军费消耗约 2000 亿美元（中美各承担一半）——这种"消耗"实际是给 G2 军工产业链带来经济动力。',
 '地区冲突恶化',
 '"消耗"叙事让 G2 军工产业获得稳定订单——表演经济学的成熟运作',
 1, 4,
 3, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0,
 4, 3, '萨赫勒 + 中亚',
 '军事/timeline.md'),

(2060, 2, 3, '经济',
 'K 街军工游说办公室开始大量关闭',
 '70 年生态的物理消解',
 '2060 年下半年 K 街军工游说办公室开始大量关闭。半年内约 40% 的相关办公室关闭。这些办公室的物理空间被新兴的"合规咨询"和"NGO"取代。前游说团成员的去向：30% 进入合规岗位、25% 进入智库、25% 进入新型 NGO（如"军工合规研究中心"）、20% 彻底转行。',
 '游说政治的物理衰退',
 '是 K 街生态最直接的经济物理表现——"游说团 → 合规岗位"的转化是 G2 设计的',
 1, 1,
 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
 3, 3, '华盛顿 K 街',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

-- ============================================================================
-- 2061-2062 · SBT + 旋转门关闭
-- ============================================================================

(2061, 1, 3, '经济',
 '第一批装甲卫星支持债券（SBT）发行',
 '美债"双重锚定"完成',
 '2061 年上半年 SBT 发行。规模 3000 亿美元。锚定资产：装甲化通讯/能源中继卫星 + 月-地能源中继链路 + 太空轨道服务收益。利率比常规美债低 60 个基点。中国央行再次成最大单一买家。',
 '太空基础设施融资创新',
 'LBT + SBT 让美国国债的"资产支持"范围扩展到月球+卫星——美债从"信用债券"完全转化为"资产支持债券"',
 1, 2,
 3, 3, 1, 1, 1, 1, 0, 0, 0, 1, 0,
 5, 3, '华盛顿 / 全球债券市场',
 '经济/us-debt-anchoring.md'),

(2061, 2, 3, '经济',
 '"晨曦事件"经济效应：装甲卫星订单激增',
 'PSA 装甲卫星市场年度增长 35%',
 '2061 年下半年"晨曦事件"（美国某太空研究站被毁，PSA Mk-4 卫星完整保留）的经济效应：装甲卫星全球订单激增 35%。市场分析师把"PSA 装甲化"称为"商业认证完成"。后来的太空保险费率开始按"PSA 装甲化 vs 未装甲化"分别定价。',
 '太空袭击事件后的市场反应',
 'G2 自我安排的"事件营销"——通过精心设计的"危机"让 PSA 装甲卫星获得市场认证',
 1, 4,
 3, 3, 0, 0, 1, 0, 0, 0, 0, 1, 0,
 4, 3, '全球太空产业',
 '军事/timeline.md'),

(2062, 1, 3, '经济',
 '《旋转门关闭法》立法的经济影响',
 '军工高管"年薪转换"机制',
 '2062 年上半年《旋转门关闭法》立法的经济影响：军工高管 10 年禁入国防部、国会军委会、采购办公室。但这种禁令需要"补偿"——所以法律配套了"年薪转换"机制：军工高管可以选择延长退休金（150% 标准）或一次性"退役金"。这让禁令在经济上对个人不构成惩罚。',
 '反腐立法的经济补偿',
 '"补偿"机制是黑调试在立法领域的具体体现——既切断政治影响，又不让被影响者经济损失',
 1, 2,
 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 3, 3, '华盛顿',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2062, 2, 3, '经济',
 '中国家庭利益申报制度的经济影响',
 '"军工高管子女不能从事军工商业"',
 '2062 年下半年中国"家庭利益申报制度"全面实施。军工高管子女不能从事任何军工相关商业活动。但同样配套了"经济保障"——子女可以从事民用版本的科技产业，且这些产业获得国家层面的"特殊投资"支持。',
 '反腐制度深化',
 '中国版的"补偿机制"——让子女在民用经济获得机会，避免对家庭的实际经济打击',
 0, 2,
 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 3, 3, '北京',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

-- ============================================================================
-- 2063-2064 · 军费"过剩"显性化
-- ============================================================================

(2063, 1, 3, '经济',
 'PSA Mk-5 量产的经济规模',
 '装甲化材料市场达到 1.8 万亿美元/年',
 '2063 年上半年 PSA Mk-5 量产带来的经济规模：装甲化材料市场达到 1.8 万亿美元/年。其中军用约 25%、月球工业约 50%、地球民用建筑约 25%。这种"军用 + 民用 + 月球工业"的三元市场让 PSA 成为继钢铁之后最重要的工业材料。',
 '装甲技术的市场扩张',
 '"三元市场"的物质基础是"军费 60-70% 实际是月球工业基础设施费"——PSA 的真实大客户是月球工业',
 0, 1,
 1, 1, 0, 0, 1, 3, 0, 0, 0, 0, 0,
 4, 3, '全球工业',
 '军事/timeline.md'),

(2063, 2, 3, '经济',
 '军费"过剩"现象首次显性化',
 '美国军费占 GDP 4.2% 但"实际敌对消耗"<1%',
 '2063 年下半年某美国学者发表研究：美国军费占 GDP 4.2%，但通过对代理人战争实际消耗、装备折旧、训练、维持等的精确计算，"实际敌对消耗"低于 GDP 1%。剩下的 3.2% 是什么？分析师无法解释——但论文被精确边缘化。',
 '军费效率的学术争议',
 '"剩下的 3.2%"实际是月球工业基础设施 + 装甲材料 + 太空运输等的"军费伪装"——但学者无法证明',
 1, 3,
 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 4, 4, '美国学界',
 '军事/timeline.md'),

(2064, 1, 3, '经济',
 '全球能源价格"过剩"固定化',
 '电力价格降到 2 美分/千瓦时',
 '2064 年上半年全球能源价格"过剩"固定化。电力价格降到 2 美分/千瓦时（2025 年的 1/5）。能源廉价化成为中美民众的可见福利——电费、燃料费、农业生产成本全面下降。',
 '聚变能源的丰裕红利',
 '"过剩"的真实原因：聚变产能持续扩张，但被代理人战争、月球工业、装甲化系统等"消耗"——这种"消耗"让市场不至于真的崩溃',
 1, 1,
 1, 1, 3, 3, 3, 1, 0, 0, 1, 1, 1,
 4, 3, '全球能源市场',
 '民生/timeline.md'),

(2064, 2, 3, '经济',
 '第三层国家"贴钱"成本系统性分析',
 '日韩印巴等年度总贴钱约 1.5 万亿美元',
 '2064 年下半年第三层国家高级官员开始系统性分析"贴钱"总成本。结论：日韩英德澳每年付出约 8000 亿美元（轨道服务费 + 美债低收益持有 + 军援延伸 + 受限贸易机会等）；第三层（印度、巴西、沙特、土耳其等）每年付出约 7000 亿美元。但找不到改变方法。',
 '（无公开版本）',
 '"找不到改变方法"是 G2 体系最隐秘的经济武器——任何"独立"都意味着失去"安全保障"和"市场准入"',
 1, 3,
 0, 0, 0, 0, 3, 0, 0, 0, 1, 3, 3,
 5, 3, '东京 / 首尔 / 新德里 / 利雅得',
 '03-tier2-foolish.md'),

-- ============================================================================
-- 2065 · OMIC + 民用衍生立法
-- ============================================================================

(2065, 1, 3, '经济',
 '美国 OMIC（军工合规办公室）成立',
 '前游说团成员的"合规化"路径',
 '2065 年上半年 OMIC 正式设立。第一年预算 80 亿美元。第一任主任来自前 K 街某游说公司的高层——这是有意设计的：让 K 街残余生态的关键人物有"合规化"出路，避免他们另起炉灶。',
 '反腐机构成立',
 '"前游说团成员任主任"是 G2 经济管理的智慧——把潜在反对者吸纳进体系',
 1, 1,
 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 4, 3, '华盛顿',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2065, 2, 3, '经济',
 '中国"民用衍生技术强制要求"立法的经济影响',
 '军工预算 50% 必须有民用衍生',
 '2065 年下半年中国"民用衍生技术强制要求"立法。军工预算的 50% 必须有可交付的民用衍生技术。具体例子：PSA → 抗震建筑（建筑业市场 8000 亿美元）；定向能 → 工业激光（制造业市场 3000 亿美元）；装甲卫星 → 通讯/气象（服务业市场 2000 亿美元）。',
 '军民融合的制度化',
 '是中国军费回流民生的关键机制——50% 强制民用衍生让"军费"实际是"民生 + 民用产业基础设施费"',
 0, 1,
 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0,
 5, 3, '北京',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

-- ============================================================================
-- 2066-2067 · 月球工业链经济整合 + 危机意识形成
-- ============================================================================

(2066, 1, 3, '经济',
 '第三座质量投射器（中国海南）开建经济意义',
 '"三投射器网络"年货运 50 万吨',
 '2066 年上半年第三座质量投射器开建的经济意义：与青藏高原（2042）和夏威夷（2052）形成"三投射器网络"。预计 2070 年建成时全网年货运能力达到 50 万吨——这让月-地货运成本降到每公斤 200 美元（从 2030 年的 5000 美元降下来）。',
 '太空货运基础设施',
 '是月球工业经济链的物质基石——50 万吨年货运量让月球工业完全经济化',
 1, 2,
 3, 3, 0, 0, 1, 3, 1, 0, 0, 1, 1,
 4, 2, '中国海南',
 '军事/timeline.md'),

(2066, 2, 3, '经济',
 '月球工业链总产值突破 5 万亿美元/年',
 '"月球经济"独立板块形成',
 '2066 年下半年月球工业链总产值突破 5 万亿美元/年（占全球 GDP 约 5%）。包括：氦三贸易 1.2 万亿、月轨工厂产出 1.8 万亿、月-地物流 0.8 万亿、月球矿物 1.0 万亿、月球医疗与研究 0.2 万亿。"月球经济"成为全球资本市场的独立板块。',
 '月球工业的成熟',
 '"独立板块"为月生代后来的"独立运动"提供物质基础——月球的经济产出已经足以支撑独立运营',
 0, 1,
 1, 1, 0, 0, 2, 3, 1, 0, 0, 0, 0,
 5, 3, '月球',
 '月壤/timeline.md'),

(2067, 1, 3, '经济',
 '拉格朗日共识"危机意识"的经济维度',
 '"如果聚变小型化突破，4 万亿美元市场瓦解"',
 '2067 年上半年拉格朗日共识"危机意识"形成的经济维度：如果聚变小型化在私人或小国手中突破，G2 控制的 4 万亿美元/年聚变能源市场会瓦解；同时月球工业链（5 万亿）也会失去 G2 主导地位；连带 LBT/SBT（合计约 1 万亿）的资产基础也会动摇。"必须把禁忌成文为国际法"是经济决策。',
 '（无公开版本）',
 '聚变小型化禁忌的真实理由是经济的——保持聚变集中化是 G2 收钱机制的物质基础',
 1, 4,
 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0,
 5, 4, 'Lagrange Palace L5',
 '08-fusion-suppression.md'),

(2067, 2, 3, '经济',
 '《禁止聚变小型化公约》谈判的"贴钱"维度',
 '盟友被精确"补偿"以同意签署',
 '2067 年下半年《禁止聚变小型化公约》谈判中 G2 给盟友的"补偿"机制：日韩签署后获得 GFSSC 高级席位 + 装甲卫星优惠采购权；欧盟获得月球工业链优先合同；印度获得"地区核能监管"特权。这些"补偿"让公约能够"自愿"签署。',
 '多边公约谈判',
 '"自愿签署"是 G2 智慧——不强迫，用经济补偿让盟友"自己同意"放弃自己的科研自由',
 1, 3,
 3, 3, 0, 0, 3, 1, 0, 0, 1, 3, 3,
 4, 3, '日内瓦',
 '08-fusion-suppression.md'),

-- ============================================================================
-- 2068 · 立法浪潮集大成 + 经济新均衡
-- ============================================================================

(2068, 1, 4, '经济',
 '《禁止聚变小型化国际公约》签署经济影响',
 '聚变能源市场永久锁定在 G2',
 '2068 年上半年公约签署的经济影响：聚变能源 4 万亿美元/年市场被永久锁定在 G2 主导。任何想突破的国家都要面对国际公约。同时 LBT 和 SBT 的资产基础得到"国际法保护"——美债的"双重锚定"被锁定 50 年。',
 '聚变能源的国际治理',
 '是 G2 经济秘密的法律化——4 万亿美元市场 + 1 万亿债券资产基础被永久保护',
 1, 1,
 3, 3, 0, 0, 3, 1, 0, 0, 1, 3, 3,
 5, 4, '日内瓦',
 '08-fusion-suppression.md'),

(2068, 2, 4, '经济',
 '美国《重建公共信任法》通过的经济结构变化',
 '军费 35% 强制公共服务投入',
 '2068 年下半年《重建公共信任法》通过的经济结构变化：军费的 35% 必须有强制公共服务投入比例（基础医疗、社区教育、退伍军人住房、社区基础设施）。从 2068 年起，每年约 4500 亿美元的军费实际流向公共服务。',
 '反腐立法的最终成果',
 '是"军费回流民生"机制的法律集大成——美国民众可见的"红利"',
 0, 1,
 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0,
 5, 3, '美国',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2068, 2, 4, '经济',
 '中国"军工民生评估委员会"成立的经济机制',
 '军工预算的"民生贡献度"年度审查',
 '2068 年下半年中国"军工民生评估委员会"成立。每年对军工企业的"民生贡献度"进行审查。低于阈值的企业被减少预算或解散。这种制度化让中国军费的"民生回流"达到 40-45%。',
 '军工合规机构',
 '与美国 OMIC + 重建公共信任法形成"双国对称"——中美两套机制虽形式不同，但功能相同：让军费回流民生',
 0, 1,
 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0,
 5, 3, '北京',
 '军事/timeline.md#主题-2军工复合体的法律强约束'),

(2068, 2, 4, '经济',
 '美元-人民币双极体系正式确立',
 '英镑彻底退出储备货币行列',
 '2068 年下半年美元-人民币双极货币体系正式确立。英镑、欧元、日元等区域化使用，但已经不再是"全球储备货币"。美元 + 人民币各占全球外汇储备约 35%（合计 70%）；其他货币合计 30%。',
 '货币体系新均衡',
 '"双极完美"成型——这是 G2 共识 32 年的经济结晶；多极幻觉变成真正的双极现实',
 1, 1,
 3, 3, 1, 1, 3, 1, 0, 0, 1, 3, 3,
 5, 3, '全球',
 '经济/timeline.md');

-- ============================================================================
-- 关联因果链 - 政治触发→经济反应（半年到 1 年滞后）
-- ============================================================================

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《轨道防扩散公约》谈判启动'),
    (SELECT id FROM facts WHERE title = '《轨道防扩散公约》谈判的经济维度'),
    'direct_cause',
    '谈判即时触发经济维度讨论';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《轨道防扩散公约》签署'),
    (SELECT id FROM facts WHERE title = '盟友"轨道服务费"机制启动'),
    'direct_cause',
    '公约签署即时启动盟友付费机制';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '盟友"轨道服务费"机制启动'),
    (SELECT id FROM facts WHERE title = '第三层国家"贴钱"成本系统性分析'),
    'culminates_in',
    '13 年累积让盟友意识到"贴钱"总成本';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第一批 LBT 政治反应'),
    (SELECT id FROM facts WHERE title = '第一批月球支持债券（LBT）正式发行'),
    'direct_cause',
    '政治协调后即时发行';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第一批月球支持债券（LBT）正式发行'),
    (SELECT id FROM facts WHERE title = 'LBT 市场反应：超额认购 3 倍'),
    'triggers',
    '发行即时触发市场抢购';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第一次"测试性战争"在东南亚启动'),
    (SELECT id FROM facts WHERE title = '第一次"测试性战争"经济效应'),
    'direct_cause',
    '战争即时触发军工股反应';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中美研究人员"互访"——实际是分工调整'),
    (SELECT id FROM facts WHERE title = '中美研究人员"互访"政策的经济激励'),
    'direct_cause',
    '互访政策的经济激励即时生效';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '装甲潜艇人员"长寿命人体研究"启动'),
    (SELECT id FROM facts WHERE title = '装甲潜艇人员长寿命研究的经济投入'),
    'direct_cause',
    '研究启动即时触发预算';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《红线条约》谈判进入最终阶段'),
    (SELECT id FROM facts WHERE title = '《红线条约》谈判的经济条款'),
    'direct_cause',
    '谈判即时确定经济条款';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国"军民融合 2.0"框架启动'),
    (SELECT id FROM facts WHERE title = '中国"军民融合 2.0"的经济结构改革'),
    'direct_cause',
    '框架启动即时触发经济改革';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《红线条约》签署' AND year = 2055),
    (SELECT id FROM facts WHERE title = '《红线条约》签署经济震荡'),
    'direct_cause',
    '签署即时触发军工股两极分化';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美国《国防采购透明法》起草'),
    (SELECT id FROM facts WHERE title = '美国《国防采购透明法》起草的经济影响'),
    'direct_cause',
    '起草即时触发游说团反弹准备';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《国防采购透明法》提交国会'),
    (SELECT id FROM facts WHERE title = '《国防采购透明法》提交国会经济维度'),
    'direct_cause',
    '提交国会即时触发军工股下跌';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《国防采购透明法》国会通过'),
    (SELECT id FROM facts WHERE title = '《国防采购透明法》通过 + 50 万美元合同公开'),
    'direct_cause',
    '通过即时触发合同透明化';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = 'GFSSC（全球聚变安全标准委员会）成立'),
    (SELECT id FROM facts WHERE title = 'GFSSC 成立的经济意义'),
    'direct_cause',
    '机构成立即时触发市场治理';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国"为民服务"KPI 全面落地'),
    (SELECT id FROM facts WHERE title = '中国"为民服务"KPI 全面落地的经济影响'),
    'direct_cause',
    'KPI 落地即时触发预算调整';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《政治献金净化法》立法启动'),
    (SELECT id FROM facts WHERE title = '《政治献金净化法》立法的经济震荡'),
    'direct_cause',
    '立法启动即时震动游说生态';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美国基础医疗"半公共化"政治推动期'),
    (SELECT id FROM facts WHERE title = '美国基础医疗"半公共化"政治推动期 + 资金到位'),
    'direct_cause',
    '政治推动 + 资金从政治献金净化法转移';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = 'Davidson 的"顿悟"——"gover 的动作太弱了"'),
    (SELECT id FROM facts WHERE title = '文明代差顿悟的经济产物'),
    'culminates_in',
    '顿悟后美方治理学习的经济应用';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《政治献金净化法》通过'),
    (SELECT id FROM facts WHERE title = '《政治献金净化法》通过经济效应'),
    'direct_cause',
    '通过即时切断资金路径';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《政治献金净化法》通过经济效应'),
    (SELECT id FROM facts WHERE title = 'K 街军工游说办公室开始大量关闭'),
    'culminates_in',
    '资金切断 24 个月后办公室开始关闭';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第二次代理人战争开始（不同地区）'),
    (SELECT id FROM facts WHERE title = '第二次代理人战争经济效应'),
    'direct_cause',
    '战争开始即时触发经济效应';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第一批 SBT 政治反应'),
    (SELECT id FROM facts WHERE title = '第一批装甲卫星支持债券（SBT）发行'),
    'direct_cause',
    '政治协调即时触发发行';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '"晨曦事件"——美国某太空研究站被毁'),
    (SELECT id FROM facts WHERE title = '"晨曦事件"经济效应：装甲卫星订单激增'),
    'triggers',
    '事件即时触发市场反应';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《旋转门关闭法》立法启动'),
    (SELECT id FROM facts WHERE title = '《旋转门关闭法》立法的经济影响'),
    'direct_cause',
    '立法即时触发"补偿机制"设计';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《旋转门关闭法》通过'),
    (SELECT id FROM facts WHERE title = '中国家庭利益申报制度的经济影响'),
    'direct_cause',
    '中美对称立法的经济执行';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = 'PSA Mk-5 量产 + 军费"过剩"现象'),
    (SELECT id FROM facts WHERE title = 'PSA Mk-5 量产的经济规模'),
    'direct_cause',
    '量产即时触发市场扩张';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '某学者质疑"军费实际去向"被精确边缘化'),
    (SELECT id FROM facts WHERE title = '军费"过剩"现象首次显性化'),
    'direct_cause',
    '学者质疑触发更深的经济分析';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美国设立 OMIC（军工合规办公室）'),
    (SELECT id FROM facts WHERE title = '美国 OMIC（军工合规办公室）成立'),
    'direct_cause',
    '机构成立即时获得预算';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国"民用衍生技术强制要求"全面立法'),
    (SELECT id FROM facts WHERE title = '中国"民用衍生技术强制要求"立法的经济影响'),
    'direct_cause',
    '立法即时触发经济结构调整';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第三座质量投射器（中国海南）开建'),
    (SELECT id FROM facts WHERE title = '第三座质量投射器（中国海南）开建经济意义'),
    'direct_cause',
    '基础设施开建即时触发经济链整合';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '拉格朗日共识"危机意识"形成'),
    (SELECT id FROM facts WHERE title = '拉格朗日共识"危机意识"的经济维度'),
    'direct_cause',
    '危机意识包含经济维度';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《禁止聚变小型化公约》谈判 + 深蓝项目种子'),
    (SELECT id FROM facts WHERE title = '《禁止聚变小型化公约》谈判的"贴钱"维度'),
    'direct_cause',
    '谈判中给盟友的经济补偿';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《禁止聚变小型化国际公约》签署'),
    (SELECT id FROM facts WHERE title = '《禁止聚变小型化国际公约》签署经济影响'),
    'direct_cause',
    '签署即时锁定市场';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美国《重建公共信任法》通过'),
    (SELECT id FROM facts WHERE title = '美国《重建公共信任法》通过的经济结构变化'),
    'direct_cause',
    '通过即时触发资金路径调整';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国"军工民生评估委员会"成立'),
    (SELECT id FROM facts WHERE title = '中国"军工民生评估委员会"成立的经济机制'),
    'direct_cause',
    '机构成立即时触发审查机制';

-- 经济间联动
INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '《政治献金净化法》通过经济效应'),
    (SELECT id FROM facts WHERE title = '美国基础医疗"半公共化"政治推动期 + 资金到位'),
    'direct_cause',
    '资金路径切断 + 重新分配到公共服务';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '中国"为民服务"KPI 全面落地的经济影响'),
    (SELECT id FROM facts WHERE title = '中国"民用衍生技术强制要求"立法的经济影响'),
    'culminates_in',
    'KPI 8 年累积发展为强制立法';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '第一批月球支持债券（LBT）正式发行'),
    (SELECT id FROM facts WHERE title = '第一批装甲卫星支持债券（SBT）发行'),
    'enables',
    'LBT 成功 9 年后扩展到 SBT';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '美元-人民币货币互换"日常化"'),
    (SELECT id FROM facts WHERE title = '美元-人民币双极体系正式确立'),
    'culminates_in',
    '32 年累积形成双极完美';

INSERT INTO fact_causes (cause_fact_id, effect_fact_id, relationship_type, notes)
SELECT
    (SELECT id FROM facts WHERE title = '月球工业人口突破 1 万的经济意义'),
    (SELECT id FROM facts WHERE title = '月球工业链总产值突破 5 万亿美元/年'),
    'culminates_in',
    '22 年累积让月球经济独立板块化';

-- ============================================================================
-- 标签关联
-- ============================================================================

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '盟友"轨道服务费"机制启动',
    '第三层国家"贴钱"成本系统性分析',
    '《禁止聚变小型化公约》谈判的"贴钱"维度'
) AND t.name = '多极幻觉';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '《政治献金净化法》立法的经济震荡',
    '美国基础医疗"半公共化"政治推动期 + 资金到位',
    '《政治献金净化法》通过经济效应',
    'K 街军工游说办公室开始大量关闭',
    '中国"为民服务"KPI 全面落地的经济影响',
    '中国"民用衍生技术强制要求"立法的经济影响',
    '美国《重建公共信任法》通过的经济结构变化',
    '中国"军工民生评估委员会"成立的经济机制',
    '中国"军民融合 2.0"的经济结构改革'
) AND t.name = '军费回流';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '第一次"测试性战争"经济效应',
    '"晨曦事件"经济效应：装甲卫星订单激增',
    '第二次代理人战争经济效应'
) AND t.name = '表演经济学';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '中美研究人员"互访"政策的经济激励',
    '黑调试机制的"经济补偿"成为常态',
    '《国防采购透明法》提交国会经济维度'
) AND t.name = '黑调试';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '《红线条约》谈判的经济条款'
) AND t.name = '盾矛分工';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '拉格朗日共识"危机意识"的经济维度',
    '《禁止聚变小型化国际公约》签署经济影响'
) AND t.name = '物质秘密';

INSERT INTO fact_tags (fact_id, tag_id)
SELECT f.id, t.id
FROM facts f, tags t
WHERE f.title IN (
    '文明代差顿悟的经济产物'
) AND t.name = '文明代差';
