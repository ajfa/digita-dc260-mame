#!/bin/bash
# Boot the Tetris and the Doom cards without a window and compare the screen at 90
# emulated seconds with tests/<card>-90s.png. Emulation is deterministic, so the
# images must match exactly. Prints PASS or FAIL for each.
set -uo pipefail

REPO=$(cd "$(dirname "$0")/.." && pwd)
B=$REPO/build
MAME=${MAME:-$B/mame/digita}
[ -x "$MAME" ] || { echo "no $MAME (run tools/build-mame.sh)"; exit 1; }

T=$B/test
rm -rf "$T"
for c in tetris doom; do
	[ -f "$B/cards/card-$c.hd" ] || { echo "no $B/cards/card-$c.hd (run tools/build-media.sh)"; exit 1; }
	d=$T/$c
	mkdir -p "$d"
	cp "$B/cards/card-$c.hd" "$d/card.hd"
	(cd "$d" && env -u DISPLAY -u WAYLAND_DISPLAY -u XDG_SESSION_TYPE \
		SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy SNAP_AT=90 \
		"$MAME" dc260 -rompath "$B/roms" -nvram_directory "$d/nvram" -cfg_directory "$d/cfg" \
		-snapshot_directory "$d/snap" -video none -sound none -skip_gameinfo -nothrottle \
		-seconds_to_run 120 -hard "$d/card.hd" -autoboot_script "$REPO/tests/snap.lua" > "$d/mame.out" 2>&1) &
done
wait

fail=0
for c in tetris doom; do
	got=$T/$c/snap/dc260/0000.png
	if [ -f "$got" ] && python3 - "$got" "$REPO/tests/$c-90s.png" <<'EOF'
import sys
from PIL import Image, ImageChops
a, b = (Image.open(p).convert("RGB") for p in sys.argv[1:3])
sys.exit(0 if a.size == b.size and ImageChops.difference(a, b).getbbox() is None else 1)
EOF
	then
		echo "PASS  $c"
	else
		echo "FAIL  $c (screen in $got)"
		fail=1
	fi
done
exit $fail
