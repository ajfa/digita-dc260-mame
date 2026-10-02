@echo off
rem Kodak DC260 that starts straight into Digita Tetris. Uses a fresh card every
rem time; the camera settings (date and so on) are the same as in CAMERA.bat.
cd /d "%~dp0."
mkdir state 2>nul
copy /y "cards-original\card-tetris.hd" "state\card-tetris.hd" >nul
"%~dp0digita.exe" dc260 -rompath "%~dp0roms" -inipath "%~dp0ini" ^
    -nvram_directory "%~dp0state\nvram" -cfg_directory "%~dp0state\cfg" ^
    -snapshot_directory "%~dp0snapshots" -window -nomaximize -skip_gameinfo ^
    -hard "%~dp0state\card-tetris.hd" %*
if errorlevel 1 pause
