# 项目：长篇小说世界观（2025–2130）

跨度百余年的近未来政治/经济科幻。世界观核心：中美 G2"拉格朗日共识体系"双层叙事——
公开叙事（`public_narrative`）与真相（`actual_truth`）并存，由 5 级知情度（`visibility_level`）建模。

详情见 `worldview/README.md` 与 `worldview/db/README.md`。

---

## 时间线纪律（写作硬约束）

**任何小说叙事正文（场景、对白、内心独白、章节摘要）写作前，必须先查 `worldview/db/worldview.db`。**

`worldview.db` 是构建产物（由 `seed_*.sql` 重建）；若种子文件刚改过，先 `cd worldview/db && ./build.sh` 再查。
**禁止凭记忆写日期、年份、事件先后、人物在场、谁知道什么。** 所有断言必须能回到 facts/characters 表的某一行（用 id 标注来源）。

### 查询原则：调脚本，不写 SQL

所有 db 查询走 `worldview/db/queries/` 下的 Python 脚本，**不要在对话里现拼 SQL**。脚本是参数化、可信、可测的；现场拼 SQL 容易写错列名、遗漏 escape、误判 NULL。

当前可用脚本：
- `worldview/db/queries/pov_check.py` — 角色 / 事件解析、POV 越权检查、可见窗口与盲区。`python3 worldview/db/queries/pov_check.py -h` 看完整 CLI。
- （规划中）`worldview/db/queries/timeline_check.py` — 因果方向、事件存在性、年份窗口扫描。

如果当前脚本满足不了校验需求，**先扩 Python 脚本再校验**，不要绕过这条规则。

### 两类校验，两个 skill

| 何时跑 | 触发 | 关心什么 |
|---|---|---|
| `/timeline-check` | "校验时间线" / "对得上吗" | 年份正确、人物在场、事件存在、因果方向 |
| `/pov-check` | "校验视角" / "有没有越权" / "上帝视角" | 角色 tier vs fact visibility_level，是否泄露 actual_truth |

写完任意叙事段落后**至少跑一次 pov-check**——视角越权是这部小说最致命的沉默 bug。
关键场景跑两个 skill 串联。

### 当 db 与现有叙事冲突

db 是事实层的真相源。如果发现矛盾：
- **db 缺失** → 先在 `seed_*.sql` 加 fact，重建，再写
- **db 错误** → 修 seed，重建，再写
- **不要在小说正文里"绕开"db 的事实**

---

## 仓库结构速记

- `worldview/` — Markdown 世界观文档（叙事性展开）
- `worldview/db/` — SQLite 结构化事实库（横切查询 + 一致性校验）
  - `schema.sql` 表结构 / `seed*.sql` 种子 / `build.sh` 重建脚本
  - 当前规模：1216 facts / 12 characters / 1242 fact_causes（截至 2026-05）
- `worldview/{经济,军事,政治,民生,...}/` — 分领域文档
- `worldview/人物档案/` — 人物深度档案

## 写作风格约束（待补充）

> 写完前 1-2 章后再回填：POV 偏好、章节长度、视角切换规则、双层叙事的呈现手法等。
