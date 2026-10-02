#!/bin/bash
# Firmware and CompactFlash cards for the DC260, from "Digita OS.zip".
# Usage: build-media.sh <Digita OS.zip>
# Result:
#   build/roms/dc260/      firmware 1.0.2 (schigh.bin, flshrsrc.bin)
#   build/cards/card.hd        Tetris in /SYSTEM, the camera starts normally
#   build/cards/card-tetris.hd the same plus /SYSTEM/TETRIS.CXM: starts straight into Tetris
#   build/cards/card-doom.hd   DoomD with the shareware DOOM1.WAD: starts straight into Doom
# Needs: unzip, xz, mtools
set -euo pipefail

ZIP=${1:?usage: build-media.sh <Digita OS.zip>}
REPO=$(cd "$(dirname "$0")/.." && pwd)
B=$REPO/build
W=$(mktemp -d)
trap 'rm -rf "$W"' EXIT
export MTOOLS_SKIP_CHECK=1

mkdir -p "$B/roms/dc260" "$B/cards"
cd "$W"
unzip -q "$ZIP" firmware-1.0.2.zip tetris.zip doomd.cam DOOM1.WAD
unzip -q firmware-1.0.2.zip system/schigh.bin system/flshrsrc.bin
cp system/schigh.bin system/flshrsrc.bin "$B/roms/dc260/"
unzip -q tetris.zip TETRIS.CAM

# A 32 MB card formatted by the emulated camera itself (MBR, then a FAT the firmware
# labels VXDOS4.0 at sector 32); one made with mkfs.fat gets "Card requires Formatting".
# Its free space is zeroed. The CXM file next to an application makes the camera
# start that application at power on (it is what Applications > Start writes).
base() { xz -dc "$REPO/cards/base_dc260.hd.xz" > "$1"; }
FAT=@@16384

base "$B/cards/card.hd"
mmd -i "$B/cards/card.hd$FAT" ::/SYSTEM
mcopy -i "$B/cards/card.hd$FAT" TETRIS.CAM ::/SYSTEM/

cp "$B/cards/card.hd" "$B/cards/card-tetris.hd"
: > TETRIS.CXM
mcopy -i "$B/cards/card-tetris.hd$FAT" TETRIS.CXM ::/SYSTEM/

# DoomD opens /B/doom1.wad (the card root) and keeps settings and saves in /DOOMDATA
base "$B/cards/card-doom.hd"
mv doomd.cam DOOMD.CAM
: > DOOMD.CXM
mmd -i "$B/cards/card-doom.hd$FAT" ::/SYSTEM ::/DOOMDATA
mcopy -i "$B/cards/card-doom.hd$FAT" DOOMD.CAM DOOMD.CXM ::/SYSTEM/
mcopy -i "$B/cards/card-doom.hd$FAT" DOOM1.WAD ::/

ls -l "$B/roms/dc260" "$B/cards"
