import csv

INPUT = "steam-games.csv"
OUTPUT = "steam-games-clean.csv"

# AppID=0, Name=1, Estimated owners=3, Peak CCU=4, Required age=5,
# Price=6, Metacritic score=18, User score=20, Positive=21, Negative=22
KEEP_IDX = [0, 1, 3, 4, 5, 6, 18, 20, 21, 22]

with open(INPUT, "r", encoding="utf-8", errors="ignore") as fin, \
     open(OUTPUT, "w", encoding="utf-8", newline="") as fout:

    writer = csv.writer(fout)
    writer.writerow([
        "AppID", "Name", "Estimated owners", "Peak CCU",
        "Required age", "Price", "Metacritic score",
        "User score", "Positive", "Negative"
    ])

    reader = csv.reader(fin)
    header = next(reader)

    for row in reader:
        if len(row) < max(KEEP_IDX) + 1:
            continue

        try:
            out = [row[i] for i in KEEP_IDX]
            writer.writerow(out)
        except Exception:
            continue