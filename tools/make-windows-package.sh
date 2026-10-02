#!/bin/bash
# Put the Windows build, the firmware, the cards and the launchers into one folder.
# Before this: build-mame-windows.sh, and build-media.sh (Linux or WSL).
# Result: build-win/DC260-Digita-Windows
set -euo pipefail

REPO=$(cd "$(dirname "$0")/.." && pwd)
EXE=${1:-$REPO/build-win/mame/digita.exe}
OUT=${2:-$REPO/build-win/DC260-Digita-Windows}
B=$REPO/build
[ -f "$EXE" ] || { echo "no $EXE (run tools/build-mame-windows.sh)"; exit 1; }
[ -f "$B/cards/card-doom.hd" ] || { echo "no cards in $B/cards (run tools/build-media.sh)"; exit 1; }

rm -rf "$OUT"
mkdir -p "$OUT/roms/dc260" "$OUT/cards-original" "$OUT/ini"
cp "$EXE" "$OUT/digita.exe"
cp "$B"/roms/dc260/*.bin "$OUT/roms/dc260/"
cp "$B"/cards/card.hd "$B"/cards/card-tetris.hd "$B"/cards/card-doom.hd "$OUT/cards-original/"
for f in "$REPO"/pack/*.bat "$REPO"/pack/README.txt "$REPO"/pack/ini/ui.ini; do
	rel=${f#"$REPO"/pack/}
	sed 's/\r*$/\r/' "$f" > "$OUT/$rel"
done
ls -l "$OUT"
