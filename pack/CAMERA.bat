@echo off
rem Kodak DC260 with its CompactFlash card. What you do on the card is kept.
cd /d "%~dp0."
if not exist "state\card.hd" (
    mkdir state 2>nul
    copy /y "cards-original\card.hd" "state\card.hd" >nul
)
"%~dp0digita.exe" dc260 -rompath "%~dp0roms" -inipath "%~dp0ini" ^
    -nvram_directory "%~dp0state\nvram" -cfg_directory "%~dp0state\cfg" ^
    -snapshot_directory "%~dp0snapshots" -window -nomaximize -skip_gameinfo ^
    -hard "%~dp0state\card.hd" %*
if errorlevel 1 pause
