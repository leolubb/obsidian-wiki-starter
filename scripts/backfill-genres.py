import os, re, json
from pathlib import Path

VAULT = Path(r"C:\AIC\OBSIDIAN\美術風格資料庫\art-db")
GAMES_DIR = VAULT / "遊戲"
GENRES_DIR = VAULT / "遊戲品類"

game_genres = {}
for f in GAMES_DIR.glob("*.md"):
    if f.name.startswith("_"):
        continue
    name = f.stem
    text = f.read_text(encoding="utf-8")
    m = re.search(r'genre:\s*(\[.*?\])', text)
    if m:
        try:
            game_genres[name] = [g.strip() for g in json.loads(m.group(1))]
        except json.JSONDecodeError:
            game_genres[name] = []
    else:
        game_genres[name] = []

print(f"Found {len(game_genres)} games")

genre_files = {}
for f in GENRES_DIR.glob("*.md"):
    if f.name.startswith("_"):
        continue
    genre_files[f.stem] = f

tag_to_page = {}
for pn in genre_files:
    tag_to_page[pn.lower()] = pn
    tag_to_page[pn] = pn

ALIAS = {
    "動作rpg": ["arpg"], "動作RPG": ["arpg"],
    "開放世界": ["大世界遊戲"], "經營模擬": ["模擬經營"],
    "休閒放置": ["放置"], "塔防": ["經典塔防"],
}

genre_games = {n: [] for n in genre_files}

for game, tags in game_genres.items():
    for tag in tags:
        tl = tag.lower().strip()
        if tl in tag_to_page:
            p = tag_to_page[tl]
            if game not in genre_games[p]:
                genre_games[p].append(game)
        elif tag in ALIAS:
            for t in ALIAS[tag]:
                if t in genre_games and game not in genre_games[t]:
                    genre_games[t].append(game)
        elif tl in ALIAS:
            for t in ALIAS[tl]:
                if t in genre_games and game not in genre_games[t]:
                    genre_games[t].append(game)

updated = 0
removed = 0
for name, fpath in genre_files.items():
    text = fpath.read_text(encoding="utf-8")
    games = sorted(genre_games.get(name, []))
    if "## 此品類的遊戲" not in text:
        continue
    if games:
        gl = "\n".join(f"- [[{g}]]" for g in games)
        ns = f"## 此品類的遊戲\n\n{gl}\n"
        tn = re.sub(r'## 此品類的遊戲\s*\n.*?(?=\n## |\Z)', ns, text, flags=re.DOTALL)
        if tn != text:
            fpath.write_text(tn, encoding="utf-8")
            print(f"FILLED: {name} <- {len(games)} games: {', '.join(games[:5])}{'...' if len(games)>5 else ''}")
            updated += 1
    else:
        tn = re.sub(r'\n## 此品類的遊戲\s*\n.*?(?=\n## |\Z)', '', text, flags=re.DOTALL)
        if tn == text:
            tn = re.sub(r'## 此品類的遊戲\s*\n.*?(?=\n## |\Z)', '', text, flags=re.DOTALL)
        if tn != text:
            tn = tn.rstrip() + "\n"
            fpath.write_text(tn, encoding="utf-8")
            print(f"REMOVED: {name}")
            removed += 1

print(f"\nDone: {updated} filled, {removed} removed")
