$gamesDir = "C:\AIC\OBSIDIAN\wiki\art-db\games"

function New-GamePage {
    param(
        [string]$Slug,
        [string]$Title,
        [string[]]$ArtStyleSlugs,
        [string[]]$ArtStyleNames,
        [string[]]$Genre,
        [string]$Complexity,
        [string]$ComplexityDetail
    )

    $filePath = Join-Path $gamesDir "$Slug.md"
    if (Test-Path $filePath) {
        Write-Host "SKIP: $Slug (exists)"
        return
    }

    $genreYaml = if ($Genre.Count -gt 0) {
        "[" + (($Genre | ForEach-Object { "`"$_`"" }) -join ", ") + "]"
    } else { "[]" }

    $styleYaml = if ($ArtStyleNames.Count -gt 0) {
        "[" + (($ArtStyleNames | ForEach-Object { "`"$_`"" }) -join ", ") + "]"
    } else { "[]" }

    $styleLinks = for ($i = 0; $i -lt $ArtStyleSlugs.Count; $i++) {
        "[[" + $ArtStyleSlugs[$i] + "|" + $ArtStyleNames[$i] + "]]"
    }
    $styleLinkStr = if ($styleLinks) { ($styleLinks -join ", ") } else { "_未分類_" }

    $complexityLine = if ($Complexity -and $ComplexityDetail) {
        "- **複雜度**: $Complexity（$ComplexityDetail）"
    } elseif ($Complexity) {
        "- **複雜度**: $Complexity"
    } else {
        "- **複雜度**: _未分類_"
    }

    $content = @"
---
type: game-art
title: "$Title"
genre: $genreYaml
art_style: $styleYaml
color_tone: ""
complexity: "$Complexity"
one_liner: ""
tags: [game-art]
---

# $Title

## 美術風格
- **畫風**: $styleLinkStr
$complexityLine

## 截圖

_待補充_
"@

    Set-Content -Path $filePath -Value $content -Encoding UTF8
    Write-Host "CREATED: $Slug"
}

# === Style 2: pixel-art ===
New-GamePage -Slug "soul-knight" -Title "元氣騎士" -ArtStyleSlugs @("pixel-art") -ArtStyleNames @("像素風 (Pixel Art)") -Genre @("Roguelike", "倖存者") -Complexity "中" -ComplexityDetail "畫風等級：倖存者 3/7"
New-GamePage -Slug "dungeon-mowing" -Title "地下城割草" -ArtStyleSlugs @("pixel-art") -ArtStyleNames @("像素風 (Pixel Art)") -Genre @("Roguelike") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "dead-cells" -Title "死亡細胞" -ArtStyleSlugs @("pixel-art") -ArtStyleNames @("像素風 (Pixel Art)") -Genre @("Roguelike", "動作冒險") -Complexity "" -ComplexityDetail ""

# === Style 3: hi-res-pixel ===
New-GamePage -Slug "octopath-traveler" -Title "Octopath Traveler" -ArtStyleSlugs @("hi-res-pixel") -ArtStyleNames @("高解析度像素風 (High-Res Pixel Art)") -Genre @("RPG") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "hyper-light-drifter" -Title "Hyper Light Drifter" -ArtStyleSlugs @("hi-res-pixel") -ArtStyleNames @("高解析度像素風 (High-Res Pixel Art)") -Genre @("動作冒險") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "blasphemous" -Title "Blasphemous" -ArtStyleSlugs @("hi-res-pixel") -ArtStyleNames @("高解析度像素風 (High-Res Pixel Art)") -Genre @("動作冒險") -Complexity "" -ComplexityDetail ""

# === Style 4: guofeng ===
New-GamePage -Slug "jiangnan-baijingtu" -Title "江南百景圖" -ArtStyleSlugs @("guofeng") -ArtStyleNames @("中國水墨 / 國風 (Guofeng)") -Genre @("經營模擬") -Complexity "" -ComplexityDetail "休閒畫風等級：手繪插畫風（中等）"
New-GamePage -Slug "bindao-bindao" -Title "繪真·妙筆千山" -ArtStyleSlugs @("guofeng") -ArtStyleNames @("中國水墨 / 國風 (Guofeng)") -Genre @("敘事遊戲") -Complexity "" -ComplexityDetail ""

# === Style 5: minimalist ===
New-GamePage -Slug "cats-are-cute" -Title "貓咪真的很可愛" -ArtStyleSlugs @("minimalist") -ArtStyleNames @("極簡手繪風 / 可愛Q版") -Genre @("休閒放置") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "tabikaeru" -Title "旅行青蛙" -ArtStyleSlugs @("minimalist") -ArtStyleNames @("極簡手繪風 / 可愛Q版") -Genre @("休閒放置") -Complexity "" -ComplexityDetail ""

# === Style 6: papercut ===
New-GamePage -Slug "tengami" -Title "Tengami" -ArtStyleSlugs @("papercut") -ArtStyleNames @("質感拼貼風 (Papercut / Collage)") -Genre @("解謎") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "luna-the-shadow-dust" -Title "Luna: The Shadow Dust" -ArtStyleSlugs @("papercut") -ArtStyleNames @("質感拼貼風 (Papercut / Collage)") -Genre @("敘事冒險") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "tearaway" -Title "Tearaway" -ArtStyleSlugs @("papercut") -ArtStyleNames @("質感拼貼風 (Papercut / Collage)") -Genre @("冒險") -Complexity "" -ComplexityDetail ""

# === Style 7: painterly ===
New-GamePage -Slug "gris" -Title "GRIS" -ArtStyleSlugs @("painterly") -ArtStyleNames @("油畫 / 插畫風 (Painterly)") -Genre @("冒險") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "sky-children-of-light" -Title "Sky光·遇" -ArtStyleSlugs @("painterly") -ArtStyleNames @("油畫 / 插畫風 (Painterly)") -Genre @("冒險", "社交") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "journey" -Title "風之旅人" -ArtStyleSlugs @("painterly") -ArtStyleNames @("油畫 / 插畫風 (Painterly)") -Genre @("冒險") -Complexity "" -ComplexityDetail ""

# === Style 8: chibi-3d ===
New-GamePage -Slug "moorland" -Title "摩爾莊園" -ArtStyleSlugs @("chibi-3d") -ArtStyleNames @("3D Q版 (Chibi 3D)") -Genre @("模擬經營", "社交") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "eggy-party" -Title "蛋仔派對" -ArtStyleSlugs @("chibi-3d") -ArtStyleNames @("3D Q版 (Chibi 3D)") -Genre @("派對遊戲") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "animal-crossing-pocket-camp" -Title "動物森友會 口袋露營廣場" -ArtStyleSlugs @("chibi-3d") -ArtStyleNames @("3D Q版 (Chibi 3D)") -Genre @("模擬經營") -Complexity "" -ComplexityDetail ""

# === Style 9: hand-drawn ===
New-GamePage -Slug "hearthstone" -Title "爐石戰記" -ArtStyleSlugs @("hand-drawn") -ArtStyleNames @("手繪插畫風 (Hand-Drawn)") -Genre @("卡牌") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "dont-starve" -Title "Don't Starve" -ArtStyleSlugs @("hand-drawn","dark-gothic") -ArtStyleNames @("手繪插畫風 (Hand-Drawn)","暗黑哥德風 (Dark Gothic)") -Genre @("生存") -Complexity "" -ComplexityDetail ""

# === Style 10: silhouette ===
New-GamePage -Slug "limbo" -Title "Limbo" -ArtStyleSlugs @("silhouette") -ArtStyleNames @("黑白剪影風 (Silhouette)") -Genre @("解謎") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "badland" -Title "Badland" -ArtStyleSlugs @("silhouette") -ArtStyleNames @("黑白剪影風 (Silhouette)") -Genre @("動作") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "shadow-fight" -Title "Shadow Fight" -ArtStyleSlugs @("silhouette") -ArtStyleNames @("黑白剪影風 (Silhouette)") -Genre @("格鬥") -Complexity "" -ComplexityDetail ""

# === Style 11: steampunk ===
New-GamePage -Slug "steampunk-tower" -Title "Steampunk Tower" -ArtStyleSlugs @("steampunk") -ArtStyleNames @("蒸汽龐克 (Steampunk)") -Genre @("塔防") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "bioshock" -Title "BioShock" -ArtStyleSlugs @("steampunk") -ArtStyleNames @("蒸汽龐克 (Steampunk)") -Genre @("FPS") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "machinarium" -Title "Machinarium" -ArtStyleSlugs @("steampunk") -ArtStyleNames @("蒸汽龐克 (Steampunk)") -Genre @("解謎") -Complexity "" -ComplexityDetail ""

# === Style 12: cyberpunk ===
New-GamePage -Slug "cyberika" -Title "Cyberika" -ArtStyleSlugs @("cyberpunk") -ArtStyleNames @("霓虹科幻風 (Cyberpunk)") -Genre @("動作RPG") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "neon-abyss" -Title "Neon Abyss" -ArtStyleSlugs @("cyberpunk") -ArtStyleNames @("霓虹科幻風 (Cyberpunk)") -Genre @("Roguelike") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "hyperforma" -Title "Hyperforma" -ArtStyleSlugs @("cyberpunk") -ArtStyleNames @("霓虹科幻風 (Cyberpunk)") -Genre @("解謎") -Complexity "" -ComplexityDetail ""

# === Style 13: dark-gothic ===
New-GamePage -Slug "onmyoji" -Title "陰陽師" -ArtStyleSlugs @("dark-gothic") -ArtStyleNames @("暗黑哥德風 (Dark Gothic)") -Genre @("RPG", "卡牌") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "castlevania-grimoire" -Title "Castlevania: Grimoire of Souls" -ArtStyleSlugs @("dark-gothic") -ArtStyleNames @("暗黑哥德風 (Dark Gothic)") -Genre @("動作冒險") -Complexity "" -ComplexityDetail ""

# === Style 14: anime ===
New-GamePage -Slug "genshin-impact" -Title "原神" -ArtStyleSlugs @("anime") -ArtStyleNames @("二次元 (Anime/ACG)") -Genre @("開放世界", "動作RPG") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "honkai-star-rail" -Title "崩壞：星穹鐵道" -ArtStyleSlugs @("anime") -ArtStyleNames @("二次元 (Anime/ACG)") -Genre @("回合制RPG") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "arknights" -Title "明日方舟" -ArtStyleSlugs @("anime") -ArtStyleNames @("二次元 (Anime/ACG)") -Genre @("塔防") -Complexity "高" -ComplexityDetail "畫風等級：塔防 6/7；休閒等級：手繪插畫風（中等）"

# === Style 15: cel-shading ===
New-GamePage -Slug "valorant-mobile" -Title "VALORANT Mobile" -ArtStyleSlugs @("cel-shading") -ArtStyleNames @("美式漫畫 / 漫畫渲染 (Cel-Shading)") -Genre @("FPS") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "fortnite" -Title "堡壘之夜" -ArtStyleSlugs @("cel-shading") -ArtStyleNames @("美式漫畫 / 漫畫渲染 (Cel-Shading)") -Genre @("射擊", "大逃殺") -Complexity "" -ComplexityDetail ""

# === Style 16: realistic ===
New-GamePage -Slug "pubg-mobile" -Title "PUBG Mobile" -ArtStyleSlugs @("realistic") -ArtStyleNames @("擬真寫實 (Realistic)") -Genre @("FPS", "大逃殺") -Complexity "" -ComplexityDetail "休閒畫風等級：PBR 實感渲染（困難）"
New-GamePage -Slug "cod-mobile" -Title "使命召喚M" -ArtStyleSlugs @("realistic") -ArtStyleNames @("擬真寫實 (Realistic)") -Genre @("FPS") -Complexity "" -ComplexityDetail "休閒畫風等級：PBR 實感渲染（困難）"

# === Style 17: street-art ===
New-GamePage -Slug "splatoon" -Title "Splatoon" -ArtStyleSlugs @("street-art") -ArtStyleNames @("美系街頭") -Genre @("射擊") -Complexity "" -ComplexityDetail ""

# === Style 18: pop-art ===
New-GamePage -Slug "katamari-damacy" -Title "Katamari Damacy" -ArtStyleSlugs @("pop-art") -ArtStyleNames @("波普藝術風格") -Genre @("休閒", "冒險") -Complexity "" -ComplexityDetail ""

# === Style 19: rubber-hose ===
New-GamePage -Slug "cuphead" -Title "Cuphead" -ArtStyleSlugs @("rubber-hose") -ArtStyleNames @("橡皮管美術 (Rubber Hose)") -Genre @("動作") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "acecraft" -Title "ACECRAFT" -ArtStyleSlugs @("rubber-hose") -ArtStyleNames @("橡皮管美術 (Rubber Hose)") -Genre @("動作") -Complexity "" -ComplexityDetail ""

# === 畫風等級 unique games: 倖存者 ===
New-GamePage -Slug "dada-commando" -Title "噠噠特攻" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("倖存者") -Complexity "低" -ComplexityDetail "畫風等級：倖存者 1/7"
New-GamePage -Slug "pickle-pete" -Title "Pickle Pete: Survivor" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("倖存者") -Complexity "低" -ComplexityDetail "畫風等級：倖存者 2/7"
New-GamePage -Slug "xiuxiu-xiuxian" -Title "咻咻修仙" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("倖存者") -Complexity "中" -ComplexityDetail "畫風等級：倖存者 4/7"
New-GamePage -Slug "cube-survival-io" -Title "Cube Survival io" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("倖存者") -Complexity "中" -ComplexityDetail "畫風等級：倖存者 5/7"
New-GamePage -Slug "shadow-survival" -Title "Shadow Survival" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("倖存者") -Complexity "高" -ComplexityDetail "畫風等級：倖存者 6/7"
New-GamePage -Slug "hungry-alien" -Title "飢餓的外星人" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("倖存者") -Complexity "高" -ComplexityDetail "畫風等級：倖存者 7/7"

# === 畫風等級 unique games: 塔防 ===
New-GamePage -Slug "the-battle-cats" -Title "貓咪大戰爭" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("塔防") -Complexity "低" -ComplexityDetail "畫風等級：塔防 1/7"
New-GamePage -Slug "zombie-gunship" -Title "向殭屍開砲" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("塔防") -Complexity "低" -ComplexityDetail "畫風等級：塔防 2/7"
New-GamePage -Slug "plants-vs-zombies" -Title "植物大戰殭屍" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("塔防") -Complexity "中" -ComplexityDetail "畫風等級：塔防 3/7"
New-GamePage -Slug "clash-royale" -Title "部落衝突：皇室戰爭" -ArtStyleSlugs @("chibi-3d") -ArtStyleNames @("3D Q版 (Chibi 3D)") -Genre @("塔防", "卡牌") -Complexity "中" -ComplexityDetail "畫風等級：塔防 4/7；休閒等級：3D 渲染 Q 版（中等）"
New-GamePage -Slug "kingdom-rush" -Title "王國保衛戰" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("塔防") -Complexity "中" -ComplexityDetail "畫風等級：塔防 5/7"
New-GamePage -Slug "iron-maiden-martha" -Title "熔鐵少女瑪莎" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("塔防") -Complexity "高" -ComplexityDetail "畫風等級：塔防 7/7"

# === 畫風等級 unique games: 模擬經營 ===
New-GamePage -Slug "stardew-valley" -Title "Stardew Valley" -ArtStyleSlugs @("pixel-art") -ArtStyleNames @("像素風 (Pixel Art)") -Genre @("模擬經營") -Complexity "低" -ComplexityDetail "畫風等級：模擬經營 1/7；休閒等級：像素風（簡易）"
New-GamePage -Slug "hotel-empire-tycoon" -Title "Hotel Empire Tycoon" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("模擬經營") -Complexity "低" -ComplexityDetail "畫風等級：模擬經營 2/7"
New-GamePage -Slug "pocket-love" -Title "Pocket Love" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("模擬經營") -Complexity "中" -ComplexityDetail "畫風等級：模擬經營 3/7"
New-GamePage -Slug "taoyuan" -Title "桃園深處有人家" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("模擬經營") -Complexity "中" -ComplexityDetail "畫風等級：模擬經營 4/7"
New-GamePage -Slug "cookie-run-kingdom" -Title "薑餅人王國" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("模擬經營") -Complexity "中" -ComplexityDetail "畫風等級：模擬經營 5/7"
New-GamePage -Slug "animal-crossing-new-horizons" -Title "集合啦！動物森友會" -ArtStyleSlugs @("chibi-3d") -ArtStyleNames @("3D Q版 (Chibi 3D)") -Genre @("模擬經營") -Complexity "高" -ComplexityDetail "畫風等級：模擬經營 6/7"
New-GamePage -Slug "the-sims-4" -Title "The Sims 4" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("模擬經營") -Complexity "高" -ComplexityDetail "畫風等級：模擬經營 7/7"

# === 畫風等級 unique games: 自走棋 ===
New-GamePage -Slug "xixing-luandou" -Title "西行乱斗" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("自走棋") -Complexity "低" -ComplexityDetail "畫風等級：自走棋 1/7"
New-GamePage -Slug "super-auto-pets" -Title "Super Auto Pets" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("自走棋") -Complexity "低" -ComplexityDetail "畫風等級：自走棋 2/7"
New-GamePage -Slug "battle-legion" -Title "Battle Legion" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("自走棋") -Complexity "中" -ComplexityDetail "畫風等級：自走棋 3/7"
New-GamePage -Slug "god-king-castle" -Title "神王城堡" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("自走棋") -Complexity "中" -ComplexityDetail "畫風等級：自走棋 4/7"
New-GamePage -Slug "clash-mini" -Title "Clash Mini" -ArtStyleSlugs @("chibi-3d") -ArtStyleNames @("3D Q版 (Chibi 3D)") -Genre @("自走棋") -Complexity "中" -ComplexityDetail "畫風等級：自走棋 5/7"
New-GamePage -Slug "dwarven-expedition" -Title "矮人探險公司" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("自走棋") -Complexity "高" -ComplexityDetail "畫風等級：自走棋 6/7"
New-GamePage -Slug "cloud-map-project" -Title "雲圖計畫" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("自走棋") -Complexity "高" -ComplexityDetail "畫風等級：自走棋 7/7"

# === 休閒畫風等級 unique games ===
New-GamePage -Slug "two-dots" -Title "Two Dots" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("解謎") -Complexity "" -ComplexityDetail "休閒畫風等級：平面向量風（簡易）"
New-GamePage -Slug "monument-valley" -Title "Monument Valley" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("解謎") -Complexity "" -ComplexityDetail "休閒畫風等級：平面向量風 / 極簡扁平（簡易）"
New-GamePage -Slug "poly-bridge" -Title "Poly Bridge" -ArtStyleSlugs @("low-poly") -ArtStyleNames @("低多邊形 (Low-poly) / 卡通風") -Genre @("解謎", "模擬") -Complexity "" -ComplexityDetail "休閒畫風等級：低多邊形（中等）"
New-GamePage -Slug "monument-valley-2" -Title "Monument Valley 2" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("解謎") -Complexity "" -ComplexityDetail "休閒畫風等級：低多邊形（中等）"
New-GamePage -Slug "dota-legends" -Title "刀塔傳奇" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("RPG") -Complexity "" -ComplexityDetail "休閒畫風等級：貼圖渲染（困難）"
New-GamePage -Slug "arena-of-valor" -Title "傳說對決" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("MOBA") -Complexity "" -ComplexityDetail "休閒畫風等級：貼圖渲染（困難）"
New-GamePage -Slug "league-of-legends" -Title "英雄聯盟" -ArtStyleSlugs @() -ArtStyleNames @() -Genre @("MOBA") -Complexity "" -ComplexityDetail "休閒畫風等級：厚塗 / 寫實插畫（困難）"
New-GamePage -Slug "black-desert" -Title "黑色沙漠" -ArtStyleSlugs @("realistic") -ArtStyleNames @("擬真寫實 (Realistic)") -Genre @("MMORPG") -Complexity "" -ComplexityDetail "休閒畫風等級：厚塗 / 寫實插畫（困難）"

# === 畫風維度 additional unique games ===
New-GamePage -Slug "azur-lane" -Title "碧藍航線" -ArtStyleSlugs @("anime") -ArtStyleNames @("二次元 (Anime/ACG)") -Genre @("射擊", "收集") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "wangchuan-fenghualu" -Title "忘川風華錄" -ArtStyleSlugs @("guofeng") -ArtStyleNames @("中國水墨 / 國風 (Guofeng)") -Genre @("RPG") -Complexity "" -ComplexityDetail ""
New-GamePage -Slug "lineage-w" -Title "天堂W" -ArtStyleSlugs @("realistic") -ArtStyleNames @("擬真寫實 (Realistic)") -Genre @("MMORPG") -Complexity "" -ComplexityDetail "畫風維度：韓系精緻渲染"
New-GamePage -Slug "seven-knights-2" -Title "七騎士2" -ArtStyleSlugs @("realistic") -ArtStyleNames @("擬真寫實 (Realistic)") -Genre @("RPG") -Complexity "" -ComplexityDetail "畫風維度：韓系精緻渲染"
New-GamePage -Slug "punishing-gray-raven" -Title "戰雙帕彌什" -ArtStyleSlugs @("cyberpunk","anime") -ArtStyleNames @("霓虹科幻風 (Cyberpunk)","二次元 (Anime/ACG)") -Genre @("動作RPG") -Complexity "" -ComplexityDetail "畫風維度：賽博朋克"
New-GamePage -Slug "dislyte" -Title "神覺者 Dislyte" -ArtStyleSlugs @("cyberpunk") -ArtStyleNames @("霓虹科幻風 (Cyberpunk)") -Genre @("RPG") -Complexity "" -ComplexityDetail "畫風維度：賽博朋克"
New-GamePage -Slug "dungeon-castle-3" -Title "地下城堡3" -ArtStyleSlugs @("dark-gothic") -ArtStyleNames @("暗黑哥德風 (Dark Gothic)") -Genre @("RPG") -Complexity "" -ComplexityDetail "畫風維度：黑色幽默 / 哥德暗黑"
New-GamePage -Slug "identity-v" -Title "第五人格" -ArtStyleSlugs @("dark-gothic") -ArtStyleNames @("暗黑哥德風 (Dark Gothic)") -Genre @("非對稱對抗") -Complexity "" -ComplexityDetail "畫風維度：黑色幽默 / 哥德暗黑"
New-GamePage -Slug "war-robots" -Title "War Robots" -ArtStyleSlugs @("realistic") -ArtStyleNames @("擬真寫實 (Realistic)") -Genre @("射擊") -Complexity "" -ComplexityDetail "畫風維度：未來科技感"

Write-Host ""
Write-Host "=== DONE ==="
$files = Get-ChildItem $gamesDir -Filter "*.md"
Write-Host "Total game pages: $($files.Count)"
