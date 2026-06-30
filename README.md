# Obsidian + Claude Code 知識庫模板

Obsidian vault 模板，預裝 13 個社群插件 + Claude Code 整合（15 個 skills、3 個 agents）。複製後用 Obsidian 打開就能用，搭配 Claude Code 可以用 AI 攝取資料、查詢、自動建頁面。

## 快速開始

```bash
# 1. Clone 模板
git clone https://github.com/leolubb/obsidian-wiki-starter.git

# 2. 複製一份，建立你自己的 vault
cp -r obsidian-wiki-starter my-wiki
cd my-wiki

# 3. 初始化你自己的 Git
rm -rf .git
git init
git add -A
git commit -m "init: 從 obsidian-wiki-starter 模板初始化"

# 4. 推上你自己的 GitHub（可選）
gh repo create my-wiki --private --source=. --push
```

用 Obsidian 打開 `my-wiki` 資料夾（Open Folder as Vault），開啟 `wiki/START-HERE.md` 照裡面的說明開始。

所有插件已預裝，clone 後直接可用，不需要另外下載。

## 目錄結構

```
wiki/                 ← 你的知識庫（主要工作區）
_templates/           ← 筆記模板（concept、entity、source、question、comparison）
_attachments/         ← 圖片與附件
.raw/                 ← 來源檔案（放這裡讓 Claude 攝取）
CLAUDE.md             ← Claude Code 設定
AGENTS.md             ← Agent 說明
README.md             ← 本文件
LICENSE               ← MIT
```

以下資料夾是 Claude Code 整合的基礎設施，**在 Obsidian 裡已隱藏**（不影響功能）：

```
skills/               ← 15 個 Claude Code skills        [隱藏]
agents/               ← 3 個 agents                     [隱藏]
commands/             ← 4 個 CLI commands                [隱藏]
bin/                  ← 5 個 setup scripts               [隱藏]
scripts/              ← 16 個 utility scripts            [隱藏]
docs/                 ← 5 份技術文件                      [隱藏]
hooks/                ← Claude Code hooks                [隱藏]
assets/               ← 架構圖                           [隱藏]
```

想在 Obsidian 裡看到它們：編輯 `.obsidian/app.json`，從 `userIgnoreFilters` 陣列中刪除對應項目。

## 預裝社群插件（13 個）

| 插件 | 用途 |
|------|------|
| Dataview | 類 SQL 查詢 |
| Templater | 模板引擎 |
| QuickAdd | 一鍵建頁面 |
| Editing Toolbar | 格式工具列 |
| Image Toolkit | 圖片檢視 |
| Mousewheel Image Zoom | 滾輪縮放圖片 |
| Media Extended | 影片嵌入 |
| Excalidraw | 手繪白板 |
| Tag Wrangler | 批量管理 tag |
| Homepage | 自動開啟首頁 |
| Notebook Navigator | 資料夾預覽 |
| Hover Editor | 浮動編輯視窗 |
| Obsidian Git | 自動 Git 同步 |
| Smart Connections | 語意搜尋 |
| Thino | 快速便條 |
| Tasks | 待辦管理 |

最低需求：**Templater** + **Obsidian Git** 就夠用。

## 搭配 Claude Code

在 vault 目錄開 Claude Code，可以用以下指令：

| 指令 | 功能 |
|------|------|
| `ingest [file]` | 攝取 Excel/PDF/URL，自動建頁面 |
| `ingest all` | 批次攝取 `.raw/` 裡的檔案 |
| 直接用中文問問題 | 從 wiki 搜尋回答，附引用來源 |
| `/autoresearch [topic]` | 多輪網路搜尋 → 交叉比對 → 報告 |
| `/save` | 對話存成 wiki 筆記 |
| `lint the wiki` | 健康檢查：孤兒頁、死連結 |
| `/canvas` | 建立 Obsidian 畫布 |

更多指令見 `wiki/START-HERE.md`。

## License

MIT
