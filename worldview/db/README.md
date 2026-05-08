# 世界观结构化事实库（SQLite）

> 与 Markdown 世界观文档互补的结构化数据存储。
> Markdown 适合**叙事性**展开，SQLite 适合**横切性**查询：
> "所有同年发生的事""所有 G2 核心层秘密""所有影响中国民生的事件"等。

---

## 文件清单

| 文件 | 用途 |
|---|---|
| [`schema.sql`](./schema.sql) | 表结构定义（含视图、索引、注释） |
| [`seed.sql`](./seed.sql) | 关键事实种子数据（约 30 条事实 + 12 人物 + 16 因果链 + 12 标签） |
| [`build.sh`](./build.sh) | 重建数据库脚本：`./build.sh` 一键重建 `worldview.db` |
| [`queries.sql`](./queries.sql) | 14 个示例查询（写作时常用横切） |
| `worldview.db` | 构建产物（不入库的话也可以从 schema + seed 重建） |

---

## 用法

### 重建

```bash
./build.sh
# 或手动
sqlite3 worldview.db < schema.sql
sqlite3 worldview.db < seed.sql
```

### 查询

```bash
# 运行所有示例查询
sqlite3 worldview.db < queries.sql

# 单条查询（带漂亮表格输出）
sqlite3 -box worldview.db "SELECT * FROM v_time_anchors LIMIT 10"

# 进入交互式 shell
sqlite3 worldview.db
```

### 添加新事实

直接编辑 `seed.sql` 末尾追加 INSERT 语句，然后 `./build.sh`。
（不要直接修改 `worldview.db`——它是构建产物，下次重建会丢失。）

---

## 维度设计

### 时间维度（4 个）

| 字段 | 类型 | 说明 |
|---|---|---|
| `year` | INTEGER | 2025-2130 |
| `half` | INTEGER | 1=上半年, 2=下半年, NULL=全年/跨年 |
| `specific_date` | TEXT | "2032-11-08" 如果已知 |
| `era_id` | FK → eras | 7 个命名时代（旧美国时代 / G2 萌芽期 / G2 盾矛锁定期 / G2 成熟期 / 外包反抗萌芽 / 慢燃期 / 汇聚日） |

### 领域维度（用户指定 8 个 + 科技 = 9 个）

`经济` / `军事` / `拉格朗日共识` / `民生` / `人物` / `月壤` / `月球工业` / `政治` / `科技`

### 视角 / 知情度（这本书的核心维度）

`visibility_level` 1-5：

| 等级 | 含义 |
|---|---|
| 1 | 全球公知（新闻头条） |
| 2 | 主流知（政府/学界/媒体高层） |
| 3 | 国家精英层知（知情派高官） |
| 4 | G2 核心 10-12 人知 |
| 5 | 永久秘密 / 仅装甲潜艇 / 月生代后期觉醒 |

加上 `has_public_lie`（公开版本是否与真相不同），完整建模这本书的"两层叙事"。

### 多维"影响"（11 个等级化指标）

每个事实可以同时影响多区域，等级 0-3：

- `affects_cn_politics`
- `affects_us_politics`
- `affects_cn_livelihood`
- `affects_us_livelihood`
- `affects_lunar_industry`
- `affects_lunar_population`（月生代——与"工业"分开，因为觉醒时间线不同）
- `affects_underwater`（装甲潜艇都市）
- `affects_tier1_russia`
- `affects_tier2_allies`（日韩英德澳）
- `affects_tier3_developing`（越南/印度/巴西/沙特）
- `affects_third_world_battle`（萨赫勒/也门/缅甸——代理战争承担方）
- `affects_global`

### 重要性 / 叙事

- `importance` 1-5
- `is_time_anchor`（在 README 时间锚点表中）
- `is_watershed`（分水岭事件）
- `narrative_value` 1-5（能否直接成为小说场景）
- `physical_location`

### 描述（双层叙事）

- `title` / `summary` / `details`
- `public_narrative`（公开版本）
- `actual_truth`（实际真相）

### 来源

- `source_md_file` / `source_section`

---

## 用户提的维度对照

用户提到的维度都被覆盖：

| 用户提到 | DB 实现 |
|---|---|
| year | `facts.year` |
| cn-政治 | `facts.affects_cn_politics`（0-3 等级） |
| us-政治 | `facts.affects_us_politics`（0-3 等级） |
| cn-民生 | `facts.affects_cn_livelihood`（0-3 等级） |
| us-民生 | `facts.affects_us_livelihood`（0-3 等级） |
| 科技 | `facts.domain = '科技'`（作为领域）+ 影响月球工业等 |
| 月球工业 | `facts.affects_lunar_industry` + `domain = '月球工业'` |

### 我额外加入的维度（建议保留）

| 维度 | 理由 |
|---|---|
| `half`（半年粒度） | 用户要求"半年为单位" |
| `era_id`（时代） | 7 个命名时代让长跨度查询更直观 |
| `visibility_level`（知情度 1-5） | **这本书最核心的设计——"对抗 > 合作"命题需要二元叙事建模** |
| `has_public_lie` + `public_narrative` + `actual_truth` | 让"公开版本 vs 真相"不一致直接可查 |
| `affects_lunar_population`（月生代） | 与月球工业分离——月生代觉醒是单独一条线 |
| `affects_underwater`（装甲潜艇都市） | 反抗的另一源头 |
| `affects_third_world_battle`（萨赫勒等） | 代理战争承担方与 tier3 国家不同 |
| `affects_tier1_russia` 单独 | 普京时代的俄罗斯地位特殊（"聪明的从属者"） |
| `is_watershed` + `is_time_anchor` | 让"哪些是真正的转折点"快速可查 |
| `narrative_value` | 写作时筛选"可直接成为场景的事实" |
| `physical_location` | 场景写作的物理基础 |
| `fact_causes`（多对多 DAG） | 因果链是这本书的关键——必须支持非树形结构 |
| `fact_characters`（多对多） | 一个事件多人参与；一个人物多事件涉及 |
| `tags`（自由标签） | 横切性主题（"盾矛分工""军费回流""文明代差"等）跨多领域 |

---

## 视图

预定义了 4 个视图便于常用查询：

- `v_facts_timeline` — 按年-半年-领域排序的所有事实
- `v_time_anchors` — README 时间锚点（重要性 + is_time_anchor=1）
- `v_lies` — 所有"公开版本与真相不一致"的事实
- `v_impact_summary` — 跨区域影响的横截视图

---

## 与 Markdown 文档的关系

| 用 Markdown | 用 SQLite |
|---|---|
| 叙事展开（"为什么这件事重要"） | 横切查询（"所有同年发生的事"） |
| 完整人物档案 | 人物-事件关联检索 |
| 可读的时间线（一个领域） | 多领域横切（"2050 年代发生了什么"） |
| 写作守则与命题 | 一致性检查（公开 vs 真相、领域分布） |

**不替代 Markdown，是补充。**

---

## 扩展计划（待用户确认）

种子数据只覆盖了约 30 条最关键事实。完整覆盖需要：

- ✅ 时间锚点全部入库（已完成）
- ⬜ 每个领域的 5 年期主要事件入库（约 +120 条）
- ⬜ 反对者档案中的 7 个详细案例入库（约 +7 条）
- ⬜ 人物档案的所有 G2 核心成员（约 +20 条）
- ⬜ 月壤/月球工业线条的所有里程碑（约 +30 条）

如果你需要我继续扩展某个特定领域，告诉我。
