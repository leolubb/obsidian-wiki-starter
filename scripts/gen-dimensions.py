import os

base = 'wiki/art-db/dimensions'

# ============ 風格 (13) ============
styles = [
    {
        'name': '日系二次元',
        'desc': 'Anime 風，線條乾淨，顏色柔和或鮮艷',
        'img': 'image85.jpg',
        'games': '[[原神]]、[[碧藍航線]]、[[明日方舟]]',
        'related': '[[二次元]]（畫風資料庫）',
    },
    {
        'name': '美式卡通',
        'desc': 'Disney、Pixar、Nickelodeon，誇張表情與厚重線條',
        'img': 'image73.jpg',
        'games': '[[荒野亂鬥]]、[[部落衝突：皇室戰爭|Clash Royale]]',
        'related': '',
    },
    {
        'name': '歐美寫實',
        'desc': 'Unreal、PBR 風格，高真實度材質',
        'img': 'image75.jpg',
        'games': '[[使命召喚M|COD Mobile]]、[[PUBG Mobile]]',
        'related': '[[擬真寫實]]（畫風資料庫）',
    },
    {
        'name': '中式國風',
        'desc': '中國水墨、國潮元素',
        'img': 'image80.jpg',
        'games': '[[江南百景圖]]、[[陰陽師|陰陽師：妖怪屋]]、[[忘川風華錄]]',
        'related': '[[中國水墨國風]]（畫風資料庫）',
    },
    {
        'name': '韓系精緻渲染',
        'desc': '光影柔和，色彩偏冷，高光細膩',
        'img': 'image227.jpg',
        'games': '[[天堂W]]、[[黑色沙漠|黑色沙漠 Mobile]]、[[七騎士2]]',
        'related': '',
    },
    {
        'name': '賽博朋克',
        'desc': '強對比、高飽和，科技未來感',
        'img': 'image72.jpg',
        'games': '[[戰雙帕彌什]]、[[神覺者 Dislyte]]、[[崩壞：星穹鐵道]]',
        'related': '[[霓虹科幻風]]（畫風資料庫，部分重疊）',
    },
    {
        'name': '哥德暗黑',
        'desc': '暗色系，誇張變形，Tim Burton 風',
        'img': 'image74.jpg',
        'games': '[[地下城堡3]]、[[第五人格|Identity V]]',
        'related': '[[暗黑哥德風]]（畫風資料庫）',
    },
    {
        'name': '蒸氣龐克',
        'desc': '銅色金屬、齒輪、19 世紀工業幻想',
        'img': 'image76.jpg',
        'games': '[[Steampunk Tower|蒸汽朋克塔防]]',
        'related': '[[蒸汽龐克]]（畫風資料庫）',
    },
    {
        'name': '童話手繪',
        'desc': '柔和筆觸，童書插畫感',
        'img': 'image71.jpg',
        'games': '《RPG 童話村物語》、《Draw a Stickman: EPIC 3》',
        'related': '[[手繪插畫風]] / [[極簡手繪風]]（畫風資料庫，部分重疊）',
    },
    {
        'name': '未來科技感',
        'desc': '流線、螢光、白銀色調',
        'img': 'image77.jpg',
        'games': '[[崩壞：星穹鐵道]]、[[War Robots]]',
        'related': '[[霓虹科幻風]]（畫風資料庫，部分重疊）',
    },
    {
        'name': '像素風（維度）',
        'desc': '復古遊戲感，強烈網格化',
        'img': 'image79.jpg',
        'games': '[[元氣騎士]]、[[Stardew Valley]]',
        'related': '[[像素風]]（畫風資料庫）',
    },
    {
        'name': '低多邊形（維度）',
        'desc': '面數低、色塊分明',
        'img': 'image91.jpg',
        'games': '[[Poly Bridge]]',
        'related': '[[低多邊形]]（畫風資料庫）',
    },
    {
        'name': '極簡扁平',
        'desc': '幾何、扁平化、無漸層',
        'img': 'image88.png',
        'games': '[[Monument Valley]]、[[Two Dots]]',
        'related': '',
    },
]

for s in styles:
    display_name = s['name'].replace('（維度）', '')
    related_section = ''
    if s['related']:
        related_section = f"\n## 對應畫風資料庫\n{s['related']}\n"

    content = f"""---
type: dimension-style
title: "{display_name}"
dimension: 風格
tags: [art-dimension, style]
---

# {display_name}

![[{s['img']}]]

## 說明
{s['desc']}

## 代表遊戲
{s['games']}
{related_section}"""

    path = os.path.join(base, '風格', f"{s['name']}.md")
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Created: 風格/{s['name']}.md")

# ============ 手法 (6) ============
techniques = [
    {
        'name': '手繪插畫風（手法）',
        'title': '手繪插畫風',
        'desc': '手繪筆刷感明顯，線條或塗層筆觸可見',
        'definition': '筆刷感明顯、線條粗細變化、光影柔和',
        'img': 'image81.jpg',
        'complexity': '🟡 中等',
        'games': '[[明日方舟]]、[[江南百景圖]]',
    },
    {
        'name': '平面向量風',
        'title': '平面向量風 (Vector)',
        'desc': 'AI/Illustrator 風格，乾淨線條與色塊',
        'definition': '乾淨線條、無筆刷紋理、色塊扁平化',
        'img': 'image88.png',
        'complexity': '🟢 簡易',
        'games': '[[Two Dots]]、[[Monument Valley]]',
    },
    {
        'name': '3D渲染Q版',
        'title': '3D 渲染 Q 版',
        'desc': 'Blender/Maya 輸出，比例可愛化',
        'definition': '3D 模型，比例可愛化，通常帶有卡通渲染',
        'img': 'image73.jpg',
        'complexity': '🟡 中等',
        'games': '[[荒野亂鬥]]、[[部落衝突：皇室戰爭|Clash Royale]]',
    },
    {
        'name': '貼圖渲染',
        'title': '貼圖渲染 (Texture Painting)',
        'desc': '貼圖手繪感，用於 3D 物件',
        'definition': '3D 模型貼圖以手繪風表現，顏色層次豐富但無真實 PBR 材質光澤',
        'img': 'image87.jpg',
        'complexity': '🔴 困難',
        'games': '[[刀塔傳奇]]、[[傳說對決]]',
    },
    {
        'name': '厚塗',
        'title': '厚塗',
        'desc': '無線稿，筆觸堆疊感強',
        'definition': '無線稿，筆觸堆疊感強，油畫感',
        'img': 'image83.jpg',
        'complexity': '🔴 困難',
        'games': '[[英雄聯盟]]、[[黑色沙漠]]',
    },
    {
        'name': '賽璐璐',
        'title': '賽璐璐',
        'desc': '動畫風格，色塊清晰分明',
        'definition': '明確線稿 + 平塗色塊，日式動畫標準手法',
        'img': '',
        'complexity': '',
        'games': '',
    },
]

for t in techniques:
    img_line = f"![[{t['img']}]]" if t['img'] else '_無參考圖片_'
    complexity_section = f"\n## 製作複雜度\n{t['complexity']}\n" if t['complexity'] else ''
    games_section = f"\n## 代表遊戲\n{t['games']}\n" if t['games'] else ''

    content = f"""---
type: dimension-technique
title: "{t['title']}"
dimension: 手法
tags: [art-dimension, technique]
---

# {t['title']}

{img_line}

## 說明
{t['desc']}

## 定義
{t['definition']}
{complexity_section}{games_section}"""

    path = os.path.join(base, '手法', f"{t['name']}.md")
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Created: 手法/{t['name']}.md")

# ============ 色彩 (7) ============
colors = [
    {'name': '高彩度', 'desc': '顏色鮮明飽和，視覺衝擊感強', 'definition': '顏色飽和度高、強烈、鮮豔', 'img': 'image73.jpg'},
    {'name': '低彩度', 'desc': '柔和灰階，質感療癒風', 'definition': '顏色偏灰、柔和、低飽和，典型莫蘭迪色調溫柔質感', 'img': 'image80.jpg'},
    {'name': '高明度', 'desc': '亮色系，白色底強烈', 'definition': '偏亮色系，接近白色，整體氛圍輕盈', 'img': 'image88.png'},
    {'name': '低明度', 'desc': '暗色系，偏哥德、恐怖或沉穩感', 'definition': '偏暗色系，整體氛圍沈穩或神秘', 'img': 'image74.jpg'},
    {'name': '對比色', 'desc': '主色與輔色對比明顯，搶眼', 'definition': '使用兩種或多種色相對比強烈的顏色，強調視覺衝擊', 'img': 'image122.jpg'},
    {'name': '單色系', 'desc': '同色系延伸，整體協調', 'definition': '使用單一色調做明度與飽和度變化，整體協調統一', 'img': 'image82.jpg'},
    {'name': '螢光色系', 'desc': '賽博、科幻風常見，強烈發光感', 'definition': '帶有強烈發光感的高彩度色系，常用於賽博朋克、夜店風格', 'img': 'image89.jpg'},
]

for c in colors:
    content = f"""---
type: dimension-color
title: "{c['name']}"
dimension: 色彩
tags: [art-dimension, color]
---

# {c['name']}

![[{c['img']}]]

## 說明
{c['desc']}

## 定義
{c['definition']}
"""

    path = os.path.join(base, '色彩', f"{c['name']}.md")
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Created: 色彩/{c['name']}.md")

print(f"\nDone! Created 26 pages.")
