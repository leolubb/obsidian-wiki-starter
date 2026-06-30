$artDb = "C:\AIC\OBSIDIAN\wiki\art-db"
$renameMap = @{}

# === Manual style slug -> short Chinese name ===
$styleMap = @{
    "anime-acg" = "二次元"
    "cel-shading" = "美式漫畫"
    "chibi-3d" = "3D Q版"
    "cyberpunk-neon" = "霓虹科幻風"
    "dark-gothic" = "暗黑哥德風"
    "guofeng" = "中國水墨國風"
    "hand-drawn" = "手繪插畫風"
    "hi-res-pixel" = "高解析度像素風"
    "low-poly" = "低多邊形"
    "minimalist-cute" = "極簡手繪風"
    "painterly" = "油畫插畫風"
    "papercut" = "質感拼貼風"
    "pixel-art" = "像素風"
    "pop-art" = "波普藝術"
    "realistic" = "擬真寫實"
    "rubber-hose" = "橡皮管美術"
    "silhouette" = "黑白剪影風"
    "steampunk" = "蒸汽龐克"
    "street-art" = "美系街頭"
}

# === Theme overrides ===
$themeOverrides = @{
    "steampunk-theme" = "蒸汽龐克題材"
    "wuxia" = "武俠仙俠"
}

# === Root files ===
$renameMap["_index"] = "遊戲美術風格資料庫"
$renameMap["dimensions"] = "畫風三維框架"

# === Link-only mappings (files already Chinese, but wikilinks still use English) ===
$renameMap["theme-selection"] = "題材選擇方法論"
$renameMap["market-fit"] = "四大市場適配分析"

# === Style files ===
foreach ($kv in $styleMap.GetEnumerator()) {
    $renameMap[$kv.Key] = $kv.Value
}

# === Genre files (use title from frontmatter) ===
foreach ($f in Get-ChildItem "$artDb\genres" -Filter "*.md") {
    $bn = $f.BaseName
    if ($bn -match '[一-鿿]') { continue }
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($content -match 'title:\s*"([^"]+)"') {
        $newName = $Matches[1]
        if ($bn -ne $newName) { $renameMap[$bn] = $newName }
    }
}

# === Theme files (use title, with overrides) ===
foreach ($f in Get-ChildItem "$artDb\themes" -Filter "*.md") {
    $bn = $f.BaseName
    if ($bn -match '[一-鿿]') { continue }
    if ($themeOverrides.ContainsKey($bn)) {
        $renameMap[$bn] = $themeOverrides[$bn]
    } else {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        if ($content -match 'title:\s*"([^"]+)"') {
            $newName = $Matches[1] -replace '[/\\:<>"|?*]', ''
            if ($bn -ne $newName) { $renameMap[$bn] = $newName }
        }
    }
}

# === Reference files ===
foreach ($f in Get-ChildItem "$artDb\references" -Filter "*.md") {
    $bn = $f.BaseName
    if ($bn -match '[一-鿿]') { continue }
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($content -match 'title:\s*"([^"]+)"') {
        $newName = $Matches[1]
        if ($bn -ne $newName) { $renameMap[$bn] = $newName }
    }
}

# === Guide files ===
foreach ($f in Get-ChildItem "$artDb\guides" -Filter "*.md") {
    $bn = $f.BaseName
    if ($bn -match '[一-鿿]') { continue }
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($content -match 'title:\s*"([^"]+)"') {
        $newName = $Matches[1]
        if ($bn -ne $newName) { $renameMap[$bn] = $newName }
    }
}

# === Game files (use title from frontmatter) ===
foreach ($f in Get-ChildItem "$artDb\games" -Filter "*.md") {
    $bn = $f.BaseName
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($content -match 'title:\s*"([^"]+)"') {
        $newName = $Matches[1] -replace ':', [char]0xFF1A -replace '[/\\<>"|?*]', ''
        if ($bn -ne $newName) { $renameMap[$bn] = $newName }
    }
}

Write-Host "=== Rename Mapping ($($renameMap.Count) entries) ==="
$renameMap.GetEnumerator() | Sort-Object Key | ForEach-Object {
    Write-Host "  $($_.Key) -> $($_.Value)"
}

# === Step 1: Rename files on disk ===
Write-Host "`n=== Step 1: Renaming files ==="
$renamed = 0
$allMdFiles = Get-ChildItem $artDb -Recurse -Filter "*.md"
foreach ($f in $allMdFiles) {
    $bn = $f.BaseName
    if ($renameMap.ContainsKey($bn)) {
        $newPath = Join-Path $f.DirectoryName "$($renameMap[$bn]).md"
        if (-not (Test-Path $newPath)) {
            Rename-Item $f.FullName -NewName "$($renameMap[$bn]).md"
            Write-Host "  RENAMED: $($f.Name) -> $($renameMap[$bn]).md"
            $renamed++
        } else {
            Write-Host "  SKIP (exists): $($f.Name) -> $($renameMap[$bn]).md"
        }
    }
}
Write-Host "Renamed $renamed files"

# === Step 2: Update wikilinks ===
Write-Host "`n=== Step 2: Updating wikilinks ==="
$allMdAfter = Get-ChildItem $artDb -Recurse -Filter "*.md"
$linkUpdates = 0

$sortedEntries = $renameMap.GetEnumerator() | Sort-Object { $_.Key.Length } -Descending

foreach ($f in $allMdAfter) {
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    $original = $content
    foreach ($kv in $sortedEntries) {
        $old = [regex]::Escape($kv.Key)
        $new = $kv.Value
        $content = $content -replace "\[\[([^\]]*?/)?${old}(\||\]\])", "[[`$1${new}`$2"
    }
    if ($content -ne $original) {
        Set-Content -Path $f.FullName -Value $content -Encoding UTF8 -NoNewline
        $linkUpdates++
        Write-Host "  UPDATED: $($f.Name)"
    }
}

# Also update wiki/index.md
$wikiIndex = "C:\AIC\OBSIDIAN\wiki\index.md"
if (Test-Path $wikiIndex) {
    $content = Get-Content $wikiIndex -Raw -Encoding UTF8
    $original = $content
    foreach ($kv in $sortedEntries) {
        $old = [regex]::Escape($kv.Key)
        $new = $kv.Value
        $content = $content -replace "\[\[([^\]]*?/)?${old}(\||\]\])", "[[`$1${new}`$2"
    }
    if ($content -ne $original) {
        Set-Content -Path $wikiIndex -Value $content -Encoding UTF8 -NoNewline
        $linkUpdates++
        Write-Host "  UPDATED: wiki/index.md"
    }
}

Write-Host "Updated links in $linkUpdates files"

# === Final Stats ===
Write-Host "`n=== Final Stats ==="
$final = Get-ChildItem $artDb -Recurse -Filter "*.md"
$cn = ($final | Where-Object { $_.BaseName -match '[一-鿿]' }).Count
Write-Host "Total files: $($final.Count)"
Write-Host "Chinese filenames: $cn"
Write-Host "English/other: $($final.Count - $cn)"
