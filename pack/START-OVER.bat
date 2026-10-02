@echo off
rem Throws away the card and the camera settings and puts everything back as it came.
cd /d "%~dp0."
echo.
echo This deletes the camera's card and its settings (date, preferences)
echo and puts everything back the way it came.
echo.
choice /c YN /m "Are you sure"
if errorlevel 2 exit /b
if exist state rmdir /s /q state
echo Done. Next time you open the camera it starts from scratch.
pause
