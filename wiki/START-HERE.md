---
type: meta
title: "開始使用"
created: 2026-06-30
updated: 2026-06-30
tags: [wiki, guide]
---

# 開始使用

歡迎使用 Obsidian + Claude Code 知識庫模板。這頁是你的起點。

## 第一次開啟？

### 1. 啟用插件

設定（左下齒輪）→ 社群插件 → 關閉「安全模式」。

這個 vault 預裝了所有插件，下面按用途分組說明。

#### 資料庫與查詢

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Bases** | 核心 | Obsidian 內建的資料庫視圖。開 `.base` 檔案就能用表格/卡片模式瀏覽所有頁面，支援篩選、排序、公式。 |
| **Dataview** | 社群 | 用類 SQL 語法在筆記裡寫即時查詢，例如「列出所有 status: developing 的頁面」。 |

#### 筆記撰寫與模板

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Templater** | 社群 | 新建頁面時自動套模板，填好 frontmatter 骨架。模板放在 `_templates/`。 |
| **QuickAdd** | 社群 | 一鍵巨集：按一個快捷鍵就建好新頁面、自動命名、套模板、放到正確資料夾。 |
| **Editing Toolbar** | 社群 | 編輯器上方多一排格式按鈕（粗體、標題、列表、表格等）。 |

#### 圖片與媒體

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Image Toolkit** | 社群 | 點擊圖片可放大檢視、旋轉、翻轉。 |
| **Mousewheel Image Zoom** | 社群 | 滑鼠滾輪直接縮放圖片大小。 |
| **Media Extended** | 社群 | 在筆記裡直接嵌入並播放影片（YouTube、本地 mp4）。 |
| **Excalidraw** | 社群 | 手繪白板工具，可以畫流程圖、概念草圖，檔案存在 vault 裡。 |

#### 導覽與組織

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Backlinks** | 核心 | 顯示「誰連到這一頁」。理解頁面之間的關係靠這個。 |
| **Outline** | 核心 | 右側邊欄顯示當前頁面的標題結構，長頁面快速跳轉。 |
| **Graph** | 核心 | 全局知識圖譜，視覺化所有頁面的連結關係。 |
| **Tag Wrangler** | 社群 | 右鍵 tag 可以批量改名、合併、刪除。 |
| **Homepage** | 社群 | 每次開 Obsidian 自動跳到指定頁面（預設是本頁）。 |
| **Notebook Navigator** | 社群 | 資料夾預覽面板，懸停資料夾就能看到裡面的筆記清單。 |
| **Hover Editor** | 社群 | 按住 `Ctrl` 懸停 `[[連結]]` 會彈出浮動編輯視窗。 |

#### 同步與版本控制

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Obsidian Git** | 社群 | 每 15 分鐘自動 commit + push。開 Obsidian 時自動 pull 最新版本。 |

#### AI 與快速筆記

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Smart Connections** | 社群 | 語意搜尋：靠「意思相近」找頁面，不只靠關鍵字。 |
| **Thino** | 社群 | 右側邊欄的快速便條面板。隨手記靈感、待辦。 |

#### 任務管理

| 插件 | 類型 | 做什麼用 |
|------|------|----------|
| **Tasks** | 社群 | 待辦事項管理，支援到期日、完成日，可用查詢聚合所有頁面的待辦。 |

> **最低需求：** 只要開 **Bases** + **Templater** + **Obsidian Git** 就能正常使用。其他按需開啟。

### 2. 開始建內容

- 在 `wiki/` 下建立你的知識庫結構（資料夾、分類）
- 用 `Ctrl+T`（Templater）從模板新建頁面
- 用 `[[雙括號連結]]` 串連相關頁面

### 3. 常用操作

| 操作 | 快捷鍵 | 說明 |
|------|--------|------|
| 快速開啟頁面 | `Ctrl+O` | 模糊搜尋檔名 |
| 全文搜尋 | `Ctrl+Shift+F` | 搜所有頁面的內容 |
| 從模板新增頁面 | `Ctrl+T` | Templater 快捷鍵 |
| 浮窗預覽/編輯 | `Ctrl+懸停連結` | Hover Editor |
| 切換編輯/閱讀模式 | `Ctrl+E` | 看排版效果 |

### 4. 搭配 Claude Code（可選）

在這個資料夾開 Claude Code，可以用 AI 操作知識庫：

**攝取與建檔**

| 指令 | 說明 |
|------|------|
| `ingest [filename]` | 讀取來源檔（Excel、PDF、URL、圖片），自動建頁面、填 frontmatter、建雙向連結 |
| `ingest all` | 批次攝取 `.raw/` 裡所有尚未處理的檔案 |
| `defuddle [url]` | 清除網頁雜訊後轉成乾淨 Markdown |

**查詢與研究**

| 指令 | 說明 |
|------|------|
| 直接用中文問問題 | 從 wiki 搜尋相關頁面，綜合回答並附引用來源 |
| `/autoresearch [topic]` | 自動研究迴圈：多輪網路搜尋 → 交叉比對 → 產出報告 |
| `/think [question]` | 結構化思考框架，適合複雜決策 |

**儲存與維護**

| 指令 | 說明 |
|------|------|
| `/save` | 把當前對話存成 wiki 筆記 |
| `lint the wiki` | 健康檢查：孤兒頁、死連結、缺 frontmatter |

**視覺與資料庫**

| 指令 | 說明 |
|------|------|
| `/canvas` | 建立或編輯 Obsidian 畫布 |
| `create a base` | 建立 Bases 資料庫視圖 |

**設定**

| 指令 | 說明 |
|------|------|
| `/wiki` | 檢查 vault 狀態、初始化設定 |
| `/wiki-mode` | 切換組織模式（Generic / LYT / PARA / Zettelkasten） |

## 如何新增一篇筆記

1. 在 `wiki/` 下建新檔案（或用 `Ctrl+T` 從模板建立）
2. 選擇模板類型：

| 模板 | 適用場景 |
|------|---------|
| `concept` | 概念、術語、方法論 |
| `entity` | 人物、組織、產品 |
| `source` | 文章、書籍、影片 |
| `question` | 問答紀錄 |
| `comparison` | A vs B 比較 |

3. 填寫 frontmatter 和正文
4. 加上相關連結：`[[概念名]]`、`[[人物名]]`
5. 圖片放 `_attachments/`，用 `![[image-name.png]]` 嵌入

## 隱藏了什麼？

為了讓 Obsidian 側邊欄保持乾淨，以下資料夾已透過 `設定 → 檔案與連結 → 排除的檔案` 隱藏。它們仍然存在於 repo 中，是 Claude Code 整合的基礎設施：

| 資料夾 | 內容 |
|--------|------|
| `skills/` | 15 個 Claude Code skills（/wiki、/autoresearch、/save 等的實作） |
| `agents/` | 3 個 Claude Code agents（verifier、wiki-ingest、wiki-lint） |
| `commands/` | 4 個 CLI commands |
| `bin/` | 5 個 setup scripts（vault 初始化、檢索設定等） |
| `scripts/` | 16 個 utility scripts（索引、鎖定、搜尋） |
| `docs/` | 5 份技術文件（安裝指南、架構說明） |
| `hooks/` | Claude Code hooks 設定 |
| `assets/` | 架構圖（SVG） |
| `.vault-meta/` | 運行時元資料（自動產生） |

**想看到它們？** 設定 → 檔案與連結 → 排除的檔案 → 刪除不需要隱藏的項目。

## 共同維護指南

### Git 工作流

**日常流程：**
1. 開 Obsidian 時 obsidian-git 會自動 pull
2. 編輯頁面後，obsidian-git 定時自動 commit + push
3. 手動操作：左側邊欄 Git 圖示 → Stage all → Commit → Push

**避免衝突：**
- 不同人各自負責不同頁面
- 共用頁面（index.md、hot.md）儘量一個人改
- 遇到衝突時手動選要保留的內容再 commit

### 品質檢查

定期跑一次：`lint the wiki`（用 Claude Code）
