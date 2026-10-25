@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Install.ps1"
set "ocbExit=%errorlevel%"
echo.
if not "%ocbExit%"=="0" (
  echo INSTALLATION NICHT ABGESCHLOSSEN. Bitte die Fehlermeldung oben beachten.
  echo Dieses Fenster bestaetigt keinen erfolgreichen Abschluss.
) else (
  echo Installation erfolgreich. Eine Taste schliesst nur dieses Fenster.
)
pause
exit /b %ocbExit%
