---
name: pov-check
description: Verify a narrative draft does not leak knowledge beyond what the POV character could perceive (knowledge_tier vs fact visibility_level). Use when checking视角越权 / 上帝视角 / POV 一致性 / 双层叙事是否串了层. Trigger on "校验视角", "pov-check", "有没有越权", "上帝视角", "这段视角对吗", "POV 检查".
---

# pov-check

防止 AI 写作时无意"开通上帝视角"——让低 tier 角色的内心独白里出现高 visibility 真相。
也防止 `actual_truth` 被泄露到角色限知场景里。

## 触发场景

- 用户写完一段含特定 POV 的叙事，问"这段视角对吗 / 有没有越权 / 上帝视角"
- 用户说「校验视角」「pov-check」「有没有泄密」
- 用户在 `timeline-check` 之后追问"那知情度呢"

## 严格规则

**不要写 SQL。** 所有数据库查询通过 `worldview/db/queries/pov_check.py` 调用。脚本是确定性的、参数化的、可信的；模型现场拼 SQL 容易出错。

**永远附 fact id / character id 溯源。** 报告中每条结论都要能回到一行真实数据。

**零匹配 = 红旗。** 草稿引用的事件在 db 里查不到时，宁可让用户加 fact，不要替模型补全。

## 输入（向用户必问，不准猜）

1. **POV 角色名** — 谁的视角？（多角色场景：分别校验）
2. **叙述模式**：
   - `角色限知`（默认，最严）
   - `全知`（叙述者可访问 actual_truth，但角色台词 / 内心仍受 tier 限）
   - `不可靠叙述者`（POV 自以为知道，需要保留破绽）
3. **场景年份**（如草稿没明示）

如草稿中无具体年份或 POV 不明确，**先问，不要继续**。

## 工作流

### 步骤 0 — 检查 db 新鲜度

```bash
python3 worldview/db/queries/pov_check.py --check-freshness
```

若 `is_fresh: False`，提示用户先 `cd worldview/db && ./build.sh`，校验中断。

### 步骤 1 — 解析 POV 角色

```bash
python3 worldview/db/queries/pov_check.py --character "<POV 名>"
```

关注字段：
- `id` — 用于后续引用
- `knowledge_tier` — 关键比对维度
- `birth_year` / `death_year` — 配合场景年做"在场"校验
- `role` — 帮助理解角色定位

若返回 `error: not found`：可能是角色未入 db，问用户是否补 characters 表。
若返回多候选：让用户选一个。

### 步骤 2 — 解析草稿中的事件引用

对草稿中每个事件性短语 E（如"聚变美元提出"、"GFSSC 成立"）：

```bash
python3 worldview/db/queries/pov_check.py --resolve-fact "<短语>"
```

记录候选 fact ids。零匹配的短语 → 红旗（草稿可能在造事件）。

### 步骤 3 — 跑核心 POV 校验（最重要的一步）

收集所有解析出的 fact ids，一起送进：

```bash
python3 worldview/db/queries/pov_check.py --pov "<POV 名>" --fact-ids 6,52,778
```

返回：
- 每个 fact 标注 `verdict=OK` 或 `verdict=OVER_TIER`
- `gap` 字段：`visibility_level - knowledge_tier`，正数即越权幅度
- `has_public_lie`、`public_narrative`、`actual_truth` 字段——用于判断"双层叙事是否串层"

### 步骤 4 — 拉一份"可见窗口 + 盲区"

```bash
python3 worldview/db/queries/pov_check.py --pov "<POV 名>" --year <场景年>
```

返回：
- `living_issues` — 角色是否已出生 / 已死亡（重要红旗）
- `perceivable` — POV 在该年附近能看到的所有 facts，正向参考（"这些是允许写的"）
- `blind_spots` — POV 看不到但同年发生的高重要事件（**这些不能写进 POV 的内心独白，但可作为外部环境的"无名压力"**）

### 步骤 5 — 双层叙事一致性（手工判断，无脚本）

对 `has_public_lie=1` 的 fact，检查草稿描述更接近 `public_narrative` 还是 `actual_truth`。
原则：
- 角色限知 + tier < 真相所需 visibility → 必须用 public 措辞
- 全知模式 → 可用 truth，但要在叙述层（不是角色思维层）
- 不可靠叙述者 → POV 用 public 但应留破绽提示真相

这一步**不能让脚本下结论**——靠模型对照 `public_narrative` 和 `actual_truth` 字段做判断，输出"建议措辞"。

### 步骤 6 — 输出报告

```markdown
## POV Check 报告

**POV 角色**: <name> (id=<id>, tier=<tier>, role=<role>)
**叙述模式**: <角色限知 / 全知 / 不可靠>
**场景年份**: <year>

### 🚨 在场性红旗（如有）
- <character> 在 <year> <not born / dead>。整段叙事不可能成立。

### 🚨 越权（OVER_TIER）
| fact | visibility | gap | 草稿原句 | 建议 |
|---|---|---|---|---|
| #778 G2 共识 20 年成熟 | 5 | +4 | "她明白这一切是 20 年前那场协议的结果" | 改为更模糊的"她隐约觉得这一切早被决定" 或 切 POV 给 tier≥5 的角色 |

### ⚠ 双层叙事歧义
- fact #52「"聚变美元"概念正式提出」has_public_lie=1
  - public: 新能源经济的标志
  - truth: 石油美元葬礼
  - 草稿原句更接近 truth → tier 1 POV 不应感知此层 → 建议改用 public 措辞

### ✅ 视角内（合规）
- fact #6 Helion 聚变并网 visibility=1 ≤ tier 1

### 📋 同年盲区（POV 看不到但氛围可暗示）
- fact #19 拉格朗日宫殿"文明代差顿悟" visibility=4
  → 不能写进 POV 内心，但可作为不被理解的背景压力存在

### 推荐动作
1. 改文：[具体几句改写]
2. 或改 db：[新增 fact / 提升角色 tier 的 INSERT 草稿]
3. 或换 POV：[切到合适 tier 的角色]
```

## 不做的事

- **不动草稿**：本 skill 只产出报告，不替用户改写
- **不下"双层叙事"机械判决**：has_public_lie=1 时让模型对照两段文字做语义判断，写明依据
- **不调用 timeline-check 的工作**：年份/事件存在性归 timeline-check；本 skill 只管 tier vs visibility 这一根维度
- **不写 SQL**：所有数据流通过 `pov_check.py` 的 CLI

## 与 timeline-check 的关系

| 维度 | timeline-check | pov-check |
|---|---|---|
| 关心 | 年份对不对、人物在不在场、事件存不存在、因果方向 | 视角能不能知道、双层叙事是否串层 |
| 失败形态 | 显式矛盾 | 沉默泄露 |
| 触发 | "校验时间线" | "校验视角" |

可串联："先校验时间线，再校验视角" → 模型先后跑两个 skill，各出各的报告。
