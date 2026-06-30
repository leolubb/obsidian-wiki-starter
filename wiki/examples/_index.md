---
type: meta
title: "示範頁面"
created: 2026-06-30
updated: 2026-06-30
tags: [wiki, examples]
---

# 示範頁面

> 這些頁面模擬 claude-obsidian 的實際產出，展示 ingest、query、Dataview 查詢、自訂 callout 等功能。
> 主題：像素遊戲。你可以直接刪除這個資料夾，不會影響任何功能。

## 功能展示對照

| claude-obsidian 功能 | 示範頁面 | 看什麼 |
|---------------------|----------|--------|
| `ingest` 來源摘要 | [[wiki/examples/sources/Celeste 開發回顧\|Celeste 開發回顧]] | source 頁的 frontmatter、key claims、`[!key-insight]` callout |
| `ingest` 實體抽取 | [[wiki/examples/entities/Maddy Thorson\|Maddy Thorson]] | entity 頁格式、backlink 到 source |
| `ingest` 概念抽取 | [[wiki/examples/concepts/像素藝術\|像素藝術]] | concept 頁格式、aliases、complexity |
| `query:` 問答產出 | [[wiki/examples/questions/為什麼像素遊戲還是很受歡迎\|為什麼像素遊戲還是很受歡迎]] | question 頁格式、confidence 等級 |
| 比較分析 | [[wiki/examples/comparisons/Celeste vs Hollow Knight\|Celeste vs Hollow Knight]] | comparison 表格、verdict |
| Dataview 查詢 | 本頁下方 ↓ | 即時查詢語法範例 |
| 自訂 callout | 各頁面中 | `[!key-insight]`、`[!contradiction]`、`[!gap]` |
| `wiki/hot.md` 格式 | [[wiki/hot\|最近更新]] | ingest 後 hot cache 的樣子 |

## Dataview 查詢範例

> 以下查詢需要啟用 Dataview 插件才會生效。在編輯模式下你會看到程式碼區塊，切到閱讀模式就會看到即時表格。

### 列出所有示範頁面

```dataview
TABLE type AS "類型", status AS "狀態", updated AS "更新日期"
FROM "wiki/examples"
WHERE type != "meta"
SORT type ASC
```

### 依狀態篩選

```dataview
LIST
FROM "wiki/examples"
WHERE status = "developing"
```

### 列出所有 key_claims

```dataview
TABLE key_claims AS "關鍵主張", confidence AS "信心度"
FROM "wiki/examples/sources"
```
