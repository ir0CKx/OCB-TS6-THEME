@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Uninstall.ps1"
set "ocbExit=%errorlevel%"
pause
exit /b %ocbExit%
