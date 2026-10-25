# RC17 – Prüfstand und Grenzen

Stand: 25. Oktober 2026. Community-Theme, keine offizielle TeamSpeak-Erweiterung.

## Automatische Layoutprüfungen

- 120 Chat-Fälle: Fenster 768×1366, 1080×1920, 1366×768, 1920×1080, 3440×1440 und 3840×2160; Chatspalten 260/295/360/600/900 CSS-Pixel; Skalierung 100/125/150/200 %.
- Lange Links bleiben unverändert und umbrechbar. Explizite Zeilenumbrüche bleiben erhalten. In schmalen Spalten steht die Nachricht unter dem Absender statt in einer schmalen Restspalte.
- 24 Nutzerkarten-Fälle: Breiten 280/360/600, Höhen 600/1200, Skalierung 100/125/150/200 %. Reihenfolge und natürliche Kartenhöhe geprüft, auch ohne Kontakt-/Abzeichenkarte.
- 20 Medien-/Code-Fälle: Bildproportionen erhalten, Bildbreite begrenzt, lange Codezeilen innerhalb ihres Blocks scrollbar.

Diese Prüfungen verwenden nachgebildete Komponenten mit dem CSS des lokal installierten TS6-Clients. Browser-Zoom simuliert Skalierung; dies ist kein Test auf 164 unterschiedlichen realen Monitoren und keine vollständige Betriebssystem-DPI-Prüfung. Die Testberichte nennen ihre Fälle einzeln. Zusätzlich 20 Fälle für die Überschrift und den Erweitert-Schalter der Channel-Bearbeitung, zusammen 184 Fälle.

## Installation und Darstellung

RC17 wurde lokal mit Sicherung der vorhandenen RC14-Version installiert und in TeamSpeak erkannt und aktiviert. Die Erscheinungsbild-Einstellungen, verbundene Serveransicht, eine Nutzerkarte und Channel-Bearbeitung wurden im Hochformat geöffnet und visuell geprüft. Dabei wurde eine Überlappung der Channel-Überschrift mit dem Erweitert-Schalter gefunden; die Korrektur wird durch 20 Breiten-/Skalierungstests abgedeckt. Navigation und Auswahl verwenden dunkle Flächen und silberne Akzente. Statusfarben bleiben erhalten.

Die ZIP-Datei wird auf Archivfehler, Pfade und Prüfsummen geprüft. Theme-Dateien bleiben unter 2 MiB pro Datei. RC16 wird nicht überschrieben. Der Originalbanner und die 4K-Textur bleiben unverändert; zusätzliches Hochskalieren bringt hier keine neuen Details.

## Noch offen

- Vollständige Live-Prüfung in allen Fenstergrößen. Keine Channel-Änderung gespeichert.
- Tatsächliche Windows-DPI-Wechsel zwischen mehreren Monitoren und Langzeit-Scrollleistung auf schwächerer Hardware.
- Explorer: Bei einem Start am 25.10.2026 um 16:14 Uhr trat zusätzlich ein Absturz in Microsoft.UI.Xaml.dll (0xc0000005) auf. Später ließen sich Downloads und das RC17-ZIP öffnen und entpacken; alle 21 Paketdateien bestanden die Prüfsummenprüfung. Eine dauerhafte Behebung des intermittierenden Explorer-Absturzes und ein ursächlicher Zusammenhang mit dem Theme sind nicht nachgewiesen. RC17 ändert keine Explorer-Einstellungen.

Die Mindestbreite und das Einklappen der Chatspalte werden weiterhin von TS6 gesteuert. Das CSS umgeht diese Beschränkung nicht. Bei sehr schmalen Fenstern die native Seitenleiste einklappen oder das Fenster verbreitern.

## Ergänzter Live-Test am 25. Oktober 2026

Bildschirmfreigabe: neutrale Anwendung mit Sekundenzähler und bewegtem Punkt ausgewählt, Anwendungsaudio ausgeschaltet. Nach ausdrücklicher Zustimmung öffentlich gestartet. Der Nutzer bestätigte auf einem zweiten Client sauberes Bild und Bewegung. Anschließend über das native Stream-Menü beendet. Dies bestätigt diesen Testlauf, keine allgemeine Netzwerk- oder Audiofreigabe-Prüfung.
