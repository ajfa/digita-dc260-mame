@echo off
rem Kodak DC260 that starts straight into DoomD with the shareware DOOM1.WAD.
rem Every start uses a fresh copy of the card, so Doom always comes up.
cd /d "%~dp0."
mkdir state 2>nul
copy /y "cards-original\card-doom.hd" "state\card-doom.hd" >nul
"%~dp0digita.exe" dc260 -rompath "%~dp0roms" -inipath "%~dp0ini" ^
    -nvram_directory "%~dp0state\nvram" -cfg_directory "%~dp0state\cfg" ^
    -state_directory "%~dp0savestates" -snapshot_directory "%~dp0snapshots" ^
    -window -nomaximize -skip_gameinfo ^
    -hard "%~dp0state\card-doom.hd" %*
if errorlevel 1 pause
