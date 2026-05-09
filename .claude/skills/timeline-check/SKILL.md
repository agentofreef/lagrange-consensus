---
name: timeline-check
description: Verify a narrative draft against the factual timeline in worldview/db/worldview.db — year/half consistency, character availability (born/alive at scene year), event existence, and cause-effect direction. Use when checking timeline correctness, "对得上吗", "校验时间线", "timeline-check", "这个人这一年还在吗", "因果方向反了吗", or after writing any narrative passage. POV/visibility leak checks are NOT covered here — use pov-check for those.
---

# timeline-check

把"草稿里的时间断言是否与 db 一致"从模型自觉变成可重复的硬步骤。
本 skill 只管事实层（年份 / 在场 / 存在 / 因果），**不**管视角越权——那是 `pov-check` 的活。

## 触发场景

- 用户写完一段含具体年份或人物的叙事，问"对得上吗 / 时间线对不对 / 因果方向"
- 用户说"校验时间线"、"timeline-check"、"这个人这一年还在吗"
- 用户写完后想跑完整 QA：先 `timeline-check`，再 `pov-check`

## 严格规则

**不要写 SQL。** 所有数据库查询通过 `worldview/db/queries/timeline_check.py` 调用。脚本是参数化、确定性、可信的。

**永远附 fact id / character id 溯源。** 报告每条结论必须能回到一行真实数据。

**零匹配 = 红旗。** 草稿引用的事件在 db 里查不到时，让用户加 fact 或改文，**不要替模型补全**。

**db 不新鲜先重建。** 步骤 0 若 `is_fresh: False`，提示用户 `cd worldview/db && ./build.sh`，校验中断。

## 输入（向用户必问，不准猜）

1. **场景年份**（如草稿中无四位数年份/年代）
2. 可选：**half**（上半年=1 / 下半年=2），如果草稿写了"上半年"/"下半年"或具体月份

## 工作流

### 步骤 0 — 检查 db 新鲜度

```bash
python3 worldview/db/queries/timeline_check.py --check-freshness
```

### 步骤 1 — 窗口扫描（场景年 ±2）

```bash
python3 worldview/db/queries/timeline_check.py --year <YEAR> --span 2
```

返回该年附近所有 watershed / time_anchor / importance≥4 事件。
用于：(a) 检查草稿是否漏掉同窗口重大事件；(b) 帮助识别草稿引用的事件落在哪个 fact id。

可加 `--domain <政治|经济|军事|拉格朗日共识|民生|月球工业|月壤|科技|人物>` 收窄。

### 步骤 2 — 人物在场校验

单角色：

```bash
python3 worldview/db/queries/timeline_check.py --character "<名>" --year <YEAR>
```

多角色一次跑：

```bash
python3 worldview/db/queries/timeline_check.py --characters "李书记,Davidson" --year <YEAR>
```

关注 `available` / `issues` 字段：
- `available: False` 是硬红旗（角色没出生 / 已死）
- 当 character 不在 db：报告"未入库"，提示用户决定是补 characters 表还是改文

### 步骤 3 — 解析草稿事件 → fact ids

对草稿里每个事件性短语（如"聚变美元提出"、"GFSSC 成立"、"文明代差顿悟"）：

```bash
python3 worldview/db/queries/timeline_check.py --resolve-fact "<短语>"
```

**零匹配** → 草稿可能在造事件 / 或事件未入 db。让用户决策，不要替补全。
**多候选** → 列出让用户选，模型不要随便挑。

### 步骤 4 — 验证年份/半年是否对得上

对每个解析到的 fact id，校验它的实际 year/half 是否与草稿声称的一致：

```bash
python3 worldview/db/queries/timeline_check.py --verify-fact <FACT_ID> --year <YEAR> [--half <1|2>]
```

`matches: False` + `issues` 列出来。例如草稿写"2058 年 G2 共识 20 年成熟"，但 fact #778 实际在 2056 → year mismatch 红旗。

### 步骤 5 — 因果方向校验

若草稿暗示 A 导致 B（已解析为 fact ids `:a` `:b`）：

```bash
python3 worldview/db/queries/timeline_check.py --check-causal <A_ID> <B_ID>
```

`verdict` 取值：
- `FORWARD` — db 中 A→B，与草稿一致 ✓
- `REVERSE` — db 中 B→A，**草稿写反了** 🚨
- `BOTH` — 双向都有（罕见，可能是 DAG 中的双重关系）
- `NONE` — db 无任何因果链。让用户决策：补一条 fact_causes 还是改文

辅助查询，了解一个 fact 的全部因果上下游：

```bash
python3 worldview/db/queries/timeline_check.py --cause-of <FACT_ID>     # 什么导致了它
python3 worldview/db/queries/timeline_check.py --effects-of <FACT_ID>   # 它导致了什么
```

### 步骤 6 — 输出报告

```markdown
## Timeline Check 报告

**场景年份**: 2058 H2
**草稿一句话复述**: ...

### 🚨 在场性红旗（如有）
- 林安然 在 2058 not born yet（birth_year=2102 > 2058）
  → 整段不可能成立。要么换 POV，要么改场景年。

### 🚨 事件不存在 / 年份对不上
| 草稿引用 | 解析到 | 问题 |
|---|---|---|
| "G2 共识 20 年成熟（2058）" | fact #778, year=2056 | year mismatch |
| "伊朗战争 2058 结束" | 0 匹配 | db 中无对应 fact，"伊朗战争"实际是 fact #1 (2026) |

### 🚨 因果方向反
- 草稿暗示「G2 解锁 → 中美决裂」
- check_causal: REVERSE — db 里 B→A，草稿写反了

### ✅ 对得上
- 李书记 2058 在场 ✓ (id=2, 2025 生)
- "文明代差顿悟" → fact #19 (2058)，年份吻合 ✓

### 📋 同窗口高重要事件（草稿是否需要带入）
- fact #19 [拉格朗日共识] importance=5 watershed
- fact #102-107 [政治] Davidson-魏对话系列
- fact #815 [月球工业] 商业化里程碑

### 推荐动作
1. 改文：[具体几句改写]
2. 或改 db：[追加 fact / fact_causes 的 INSERT 草稿]
```

### 跑完后建议

> 时间线对了不代表视角对——接着说「校验视角」/`pov-check`，让 pov-check 检查同一段草稿的 tier vs visibility。

## 不做的事

- **不写 SQL** — 所有查询走 `timeline_check.py`
- **不动草稿** — 只产出报告，修改由用户决策
- **不查 visibility 越权** — 那是 pov-check 的职责
- **不替用户补 fact** — 零匹配只报告，让用户来决定补 db 还是改文

## 与 pov-check 的关系

| 维度 | timeline-check（本 skill） | pov-check |
|---|---|---|
| 关心 | 年份对不对、人物在不在场、事件存不存在、因果方向 | 角色 tier vs fact visibility，是否泄露 actual_truth |
| 失败形态 | 显式矛盾（容易看出） | 沉默泄露（容易漏） |
| 触发 | "校验时间线" | "校验视角" |
| 共享脚本 | 同一个 `worldview/db/queries/_common.py` | 同上 |

可串联："**先 timeline-check 再 pov-check**" → 模型先后跑两个 skill，各出各的报告。关键场景两个都跑。
