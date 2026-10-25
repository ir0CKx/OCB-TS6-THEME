@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Daten\Diagnose.ps1"
set "ocbExit=%errorlevel%"
pause
exit /b %ocbExit%
