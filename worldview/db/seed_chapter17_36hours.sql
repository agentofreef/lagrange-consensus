-- ============================================================================
-- Ch 17 民众的 36 小时 / 角色种子 (UPDATE only)
-- ============================================================================
-- 目的：完善 seed_chapter14_populace.sql 已经创建的 3 个美方民众角色描述
-- (id=24 Tom Hartwell / id=26 Maria Hernandez / id=27 Kevin O'Brien)
-- 通过 UPDATE 添加 Ch 14 详细背景 + Ch 17 4.3-4.4 36 小时反应
-- 调用顺序：在 seed_chapter16_red_phone.sql 之后 / seed_fixes_logic.sql 之前
-- ============================================================================

-- id=24 Tom Hartwell / Tommy Jr 父亲 / Ch 4 + Ch 14 + Ch 17
UPDATE characters
SET aliases = 'Tom 老',
    role = 'ArcelorMittal Burns Harbor 钢铁工 / Tommy Hartwell Jr 父亲',
    description = '1984 年生 / 50 岁 2034 / 印第安纳 Gary / ArcelorMittal Burns Harbor 钢铁厂 25 年 / 2029 被裁后回炉返厂 / 妻 Sarah / 长子 Tommy Hartwell Jr (海军陆战队 1Lt) / 2033.5 收到 Tommy Jr 纸信描述 USS Wasp 供给变慢（弹药库 64% / 食物 24 种）/ MAGA 红帽戴 5 年 / 2032.10 去 Indianapolis 参加 R 连任 rally / 2034.11 看见 R 输给 Mackenzie / 实际购买力 +8% / 主观"我们在赢"/ 美国工人阶级 MAGA 温和派代表 / 父子两代"对抗中国"5 年 / 4.3-4.4 美元危机 36 小时不知道发生什么但担心钢铁厂订单'
WHERE id = 24;

-- id=26 Maria Hernandez / 加州 Bakersfield 单亲妈妈 / Ch 8 + Ch 14 + Ch 17
UPDATE characters
SET aliases = 'Maria',
    role = '加州 Bakersfield 单亲妈妈 / Walmart + Amazon + Uber Eats 3 份工',
    description = '1994 年生 / 40 岁 2034 / 加州 Bakersfield (原 Stockton) / 墨西哥裔 / 2033.6 与丈夫 David 离婚 / 3 个孩子分两边: 15 岁 Diego 和她住 / 17 岁 Sofia 在德州社区大学 / 13 岁 Roberto 跟 David 在 Houston / 3 份工: Walmart 早班 5:00-13:30 ($15.20/h) + Amazon 仓库夜班 23:00-07:00 ($18.50/h) + 周末 Uber Eats / 一周 $1,400 税前 / 一年 $73K (vs 婚内 $32K) / 翻倍多 / 瘦 18 磅 / 睡 4 小时 / 2032 起读 Sarah Goldberg Substack / "努力主义+结构怀疑两可"代表 / 实际购买力 +120% / 主观"自己努力换来" / 4.3-4.4 美元危机 36 小时超市食品价格短暂飙涨 30% 然后回落她不知道为什么'
WHERE id = 26;

-- id=27 Kevin O'Brien / 德州奥斯汀 / Ch 10 + Ch 14 + Ch 17
UPDATE characters
SET aliases = 'Kevin',
    knowledge_tier = 2,
    role = '德州奥斯汀 Helix Labs LLM 集成工程师 / 哈佛 CS / 看穿但沉默',
    description = '2007 年生 / 27 岁 2034 / 哈佛 CS 2029 毕业 / 2029-2033 硅谷 NextStream AI / 2033.4 NextStream 被 Anthropic 收购 / 拿 80K 离职金 / 申请 Anthropic 没要他 / 搬到德州奥斯汀 / 加入 Helix Labs (30 人 startup / 企业 LLM 集成) / $145K base (vs 硅谷 $230K -37%) / 但德州生活成本低 / 实际购买力 +5% / 父亲俄亥俄退休工人 MAGA / 母亲全职妈妈 Fox News / 妹妹护士 R 选民 / 他不和家人谈政治 / 5 年读 Sarah Substack / 看穿 H-1B 驱逐 + AFFSRA 副作用 / 但保持沉默 / 与 Vikram Patel (印度 SkyTrace AI CTO / 被驱逐的同事) 偶尔 LinkedIn / 美国年轻精英"看穿但沉默"代表 / 4.3-4.4 美元危机 36 小时早 5:30 ATM 排队取 5000 美元屯食物'
WHERE id = 27;

-- 删除重复 INSERT 创建的 id=54/55/56
DELETE FROM characters WHERE id IN (54, 55, 56);
