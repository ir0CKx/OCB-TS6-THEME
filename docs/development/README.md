# Entwickeln und prüfen

Voraussetzungen: Python 3.10+, Node.js 22+, PowerShell für Installer-Tests. `npm install` installiert Playwright; `npx playwright install chromium` installiert den Testbrowser. Alternativ `CHROME_PATH` auf einen vorhandenen Chrome setzen.

## Paket bauen
`python tools/build.py` erzeugt ausschließlich in `dist/` ein frisches ZIP und dessen SHA256. Der Build nutzt ein temporäres Verzeichnis und feste ZIP-Zeitstempel. Keine alten Dateien werden übernommen. Die Starter im Quellrepository sind für das gebaute Download-Paket bestimmt.

## Browserprüfungen
`TS6_CSS` muss auf `html/client_ui/main.css` der zu prüfenden TS6-Installation zeigen. Diese proprietäre Datei wird nicht im Repository verteilt. Unter PowerShell: `$env:TS6_CSS = "$env:LOCALAPPDATA/Programs/TeamSpeak/html/client_ui/main.css"`, anschließend `npm test`. Ergebnisse unter `test-results/` (nicht eingecheckt).

Die Tests sind Komponentenprüfungen mit Original-Client-CSS; sie ersetzen keinen vollständigen Client-Test. Chat, Medien, Profil, Channel-Editor, Dashboard und aktive/ausgewählte/Drag-and-drop-Zustände werden geprüft. Streaming-Grundsymbole werden anhand der Bedienelemente geprüft, einschließlich optionaler Felder und veränderter Reihenfolge.

## Installation
Nach dem Build: `powershell -NoProfile -ExecutionPolicy Bypass -File tests/installer.ps1`. Nur isolierte Testverzeichnisse; laufender/geschlossener Client und Kopierfehler werden simuliert. Kein Eingriff in die echte Installation.

## Vor Veröffentlichung
Im echten Client: Antworten/Bearbeiten, Mehrfachauswahl, ungelesene Nachrichten, Anhänge, Commander/Whisper, Streaming-Dialog, Popout und Vollbild prüfen. Darstellung bei 100/125/150/200 Prozent und schmalen/breiten Fenstern vergleichen. Bei Performancevergleichen Standardtheme und OCB auf derselben Hardware verwenden. Automatische CI prüft Paketbau und Installer; Browserchecks benötigen TS6_CSS und laufen lokal.

Scrollvergleich: Nach den Browserprüfungen `node tests/performance.cjs`. Alle Testbilder und Messdaten bleiben lokal in test-results. Gleiche TS6-Version und gleicher Browser sind für Vergleiche erforderlich.

Paketinhalt: nach dem Build `python tests/package.py`. Diagnose.ps1 ist ausschließlich ein Entwicklerwerkzeug und nicht Teil des Nutzerpakets.
