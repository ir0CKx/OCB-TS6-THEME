# Installation und Wiederherstellung

## Windows – Schritt für Schritt

![Installation in sechs Etappen](INSTALLATION-UEBERSICHT.svg)

1. **TeamSpeak 6 vollständig schließen**, auch unten rechts im Infobereich der Windows-Taskleiste.
2. Die heruntergeladene **ZIP-Datei vollständig entpacken** (Rechtsklick → Alle extrahieren).
3. Den **entpackten Ordner öffnen**. Nicht direkt aus der ZIP heraus installieren.
4. **`INSTALL OCB.GG DARK THEME` doppelt anklicken** (Dateityp: Windows-Befehlsskript, vollständiger Name: `INSTALL OCB.GG DARK THEME.cmd`). Windows blendet `.cmd` häufig aus. Normal starten; **nicht als Administrator ausführen**.
5. Auf die Meldung **„ERFOLGREICH INSTALLIERT“** mit dem Installationsziel warten. Danach eine beliebige Taste drücken, um das schwarze Fenster zu schließen. Das Theme wurde bereits vorher in den TeamSpeak-Erweiterungsordner kopiert. **Bei einer Fehlermeldung ist die Installation nicht erfolgreich abgeschlossen.**
6. Den entpackten Ordner schließen.
7. **TeamSpeak 6 starten.**
8. **Einstellungen → Erscheinungsbild → Benutzer-Theme** öffnen und den Haken bzw. Schalter aktivieren. Falls nötig, die Theme-Liste über das Aktualisieren-Symbol neu laden. Die Bezeichnungen können je nach Client-Version abweichen.
9. Zuerst **OCB.GG - Glass & Dark Theme v1.0.0-rc.25**, danach darunter **OCB.GG - Glass & Dark** anklicken und aktivieren.
10. Mit eurem **OCB-TeamSpeak-Server verbinden**.
11. Sobald das Theme funktioniert, kannst du die **heruntergeladene ZIP und den entpackten Installationsordner löschen**. Die installierte Kopie bleibt in TeamSpeak erhalten. Den Ordner im TeamSpeak-Erweiterungsverzeichnis nicht löschen.

Standardziel: %APPDATA%\TeamSpeak\Default\extensions\gg.ocb.obsidian
Für andere Profile den Ordner gg.ocb.obsidian manuell in deren extensions-Verzeichnis kopieren. package.json liegt direkt im Theme-Ordner.

## Update
Erneut installieren. Die bisherige Version wird vor dem Austausch in ocb-theme-backups neben dem extensions-Ordner gesichert. Der Installer überprüft die kopierten Dateien; bei einem Fehler beim abschließenden Verschieben wird die vorherige Version wiederhergestellt, sofern das Ziel frei ist.

## Deinstallation
In TeamSpeak zunächst ein anderes Theme auswählen, dann den Client schließen und **`UNINSTALL OCB.GG DARK THEME`** starten (vollständig: `UNINSTALL OCB.GG DARK THEME.cmd`). Das OCB-Theme wird in den Backup-Ordner verschoben. Server und Benutzereinstellungen werden nicht entfernt.

## Manuelle Installation
Linux: ~/.config/TeamSpeak/Default/extensions
macOS: ~/Library/Preferences/TeamSpeak/Default/extensions
Diese Plattformen wurden nicht praktisch getestet. Bei abweichenden Profilen deren Erweiterungsverzeichnis nutzen.

## Serverbanner
Das optionale Server-Asset-ZIP separat entpacken. Für die zugehörigen Kanalbanner bei höherer Display-Skalierung die Dateien aus HiDPI-1124x72 verwenden. Kanal-/Serverbanner müssen separat mit passenden Rechten konfiguriert werden. Der Theme-Installer übernimmt weder Uploads noch Servergruppen oder Rechte.

## Fehlerbehebung
Theme fehlt: Ordnerstruktur prüfen; keine zusätzliche Verschachtelung zwischen gg.ocb.obsidian und package.json. Themes neu laden oder Client neu starten.
Darstellung fehlerhaft: Standardtheme wählen und Client-Version, Skalierung sowie betroffenen Dialog für eine Fehlermeldung notieren.
Bildschirmfreigabe gestört: zunächst mit dem Standardtheme vergleichen. Das OCB-Theme konfiguriert keine Freigaberechte oder Netzwerkverbindungen.

Das Theme nutzt ein zusammenhaengendes Wellenbild hinter dem Kanalbaum. Einzelne serverseitige Kanalbilder werden lokal ausgeblendet, einschliesslich eventuell darin eingebauter Texte/Logos; native Kanalnamen, Icons und der Server-Kopfbanner bleiben sichtbar. Bei deaktiviertem Theme erscheinen die Serverbilder wieder.

## Wechsel von RC18 und älter
Nach der Installation das aktuelle OCB-Paket und darunter **OCB.GG - Glass & Dark** auswählen. Ab RC19 bleibt die CSS-Datei gleich. Falls eine Paketprüfung zusätzliche Theme-Dateien meldet, das neue ZIP in einen leeren Ordner entpacken statt alte und neue Installationsdateien zu mischen.

## Häufige Stolperstellen

- **Datei finden:** Die Installation heißt `INSTALL OCB.GG DARK THEME.cmd`, die Deinstallation `UNINSTALL OCB.GG DARK THEME.cmd`. `Install.ps1` ist die Hilfsdatei; für den normalen Ablauf den `.cmd`-Starter verwenden.
- **ZIP vollständig entpacken:** Neben dem Starter müssen `Install.ps1`, `Verify-Package.ps1`, `SHA256SUMS.txt` und `gg.ocb.obsidian` liegen. Nicht nur den Starter herausziehen. Für jedes Update einen neuen, leeren Ordner verwenden.
- **TeamSpeak noch geöffnet:** Auch das Symbol im Infobereich prüfen. Bei der entsprechenden Fehlermeldung TeamSpeak beenden und erneut installieren.
- **Paketprüfung fehlgeschlagen:** Nicht weiterkopieren. Das aktuelle Release neu herunterladen und vollständig in einen leeren Ordner entpacken.
- **Theme nicht sichtbar:** In TeamSpeak „Verzeichnis für Erweiterungen öffnen“ verwenden und mit dem vom Installer ausgegebenen Ziel vergleichen. Bei einem anderen Profil dessen Verzeichnis nutzen. `package.json` muss direkt in `extensions/gg.ocb.obsidian/` liegen. Anschließend die Theme-Liste aktualisieren.
- **Anderes Windows-Konto:** Der Installer verwendet den Benutzer, unter dem er gestartet wurde. Deshalb normal unter dem eigenen Konto starten; keine fremden Administrator-Anmeldedaten verwenden.
- **Deinstallation nach Aufräumen:** Falls das entpackte Paket bereits gelöscht wurde, das aktuelle ZIP erneut entpacken und `UNINSTALL OCB.GG DARK THEME.cmd` starten.
