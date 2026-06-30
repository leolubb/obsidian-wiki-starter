import re
from pathlib import Path

GAMES_DIR = Path(r"C:\AIC\OBSIDIAN\美術風格資料庫\art-db\遊戲")

STYLE_MAP = {
    "日系二次元": ["原神", "碧藍航線", "明日方舟"],
    "美式卡通": ["荒野亂鬥", "部落衝突：皇室戰爭"],
    "歐美寫實": ["使命召喚M", "PUBG Mobile"],
    "中式國風": ["江南百景圖", "陰陽師", "忘川風華錄"],
    "韓系精緻渲染": ["天堂W", "黑色沙漠", "七騎士2"],
    "賽博朋克": ["戰雙帕彌什", "神覺者 Dislyte", "崩壞：星穹鐵道"],
    "哥德暗黑": ["地下城堡3", "第五人格"],
    "蒸氣龐克": ["Steampunk Tower"],
    "未來科技感": ["崩壞：星穹鐵道", "War Robots"],
    "像素風": ["元氣騎士", "Stardew Valley"],
    "低多邊形": ["Poly Bridge"],
    "極簡扁平": ["Monument Valley", "Two Dots"],
}

TECH_MAP = {
    "手繪插畫風": ["明日方舟", "江南百景圖"],
    "平面向量風": ["Two Dots", "Monument Valley"],
    "3D渲染Q版": ["荒野亂鬥", "部落衝突：皇室戰爭"],
    "貼圖渲染": ["刀塔傳奇", "傳說對決"],
    "厚塗": ["英雄聯盟", "黑色沙漠"],
}

STYLE_LINKS = {
    "低多邊形": "[[低多邊形（維度）|低多邊形]]",
}

TECH_LINKS = {
    "手繪插畫風": "[[手繪插畫風（手法）|手繪插畫風]]",
    "3D渲染Q版": "[[3D渲染Q版|3D 渲染 Q 版]]",
}

def style_link(cat):
    return STYLE_LINKS.get(cat, f"[[{cat}]]")

def tech_link(cat):
    return TECH_LINKS.get(cat, f"[[{cat}]]")

game_data = {}
for cat, games in STYLE_MAP.items():
    for g in games:
        game_data.setdefault(g, {"styles": [], "techniques": []})
        game_data[g]["styles"].append((cat, style_link(cat)))

for cat, games in TECH_MAP.items():
    for g in games:
        game_data.setdefault(g, {"styles": [], "techniques": []})
        game_data[g]["techniques"].append((cat, tech_link(cat)))

name_to_file = {}
for f in GAMES_DIR.glob("*.md"):
    if f.name == "_遊戲索引.md":
        continue
    name_to_file[f.stem] = f

def find_file(game_name):
    if game_name in name_to_file:
        return name_to_file[game_name]
    for stem, f in name_to_file.items():
        if stem.lower() == game_name.lower():
            return f
    return None

updated = []
skipped_no_file = []

for game_name, data in game_data.items():
    fpath = find_file(game_name)
    if not fpath:
        skipped_no_file.append(game_name)
        continue

    content = fpath.read_text(encoding="utf-8")
    original = content

    styles = data["styles"]
    techniques = data["techniques"]

    new_lines = []
    if styles:
        links = "、".join(link for _, link in styles)
        new_lines.append(f"- **風格（三維框架）**: {links}")
    if techniques:
        links = "、".join(link for _, link in techniques)
        new_lines.append(f"- **手法（三維框架）**: {links}")

    if not new_lines:
        continue

    if "風格（三維框架）" in content or "手法（三維框架）" in content:
        continue

    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if "**畫風**" in line:
            insert_idx = i + 1
            break

    if insert_idx is None:
        for i, line in enumerate(lines):
            if line.strip().startswith("## 美術風格"):
                insert_idx = i + 1
                break

    if insert_idx is not None:
        for j, nl in enumerate(new_lines):
            lines.insert(insert_idx + j, nl)
        content = "\n".join(lines)

    if "art_style: []" in content and styles:
        style_names = [cat for cat, _ in styles]
        style_str = ", ".join(f'"{s}"' for s in style_names)
        content = content.replace("art_style: []", f"art_style: [{style_str}]")

    if content != original:
        fpath.write_text(content, encoding="utf-8")
        changes = []
        if styles:
            changes.append("風格=" + ",".join(c for c, _ in styles))
        if techniques:
            changes.append("手法=" + ",".join(c for c, _ in techniques))
        updated.append(f"{fpath.name}: {'; '.join(changes)}")

print("=== UPDATED ===")
for u in sorted(updated):
    print(u)
print(f"\nTotal updated: {len(updated)}")

if skipped_no_file:
    print(f"\n=== NO FILE FOUND ===")
    for s in sorted(skipped_no_file):
        print(s)
