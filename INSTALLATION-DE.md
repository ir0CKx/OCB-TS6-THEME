# Installation und Wiederherstellung

## Windows
1. Das gesamte ZIP in einen eigenen Ordner entpacken.
2. TeamSpeak schließen.
3. Optional VERIFY-WINDOWS.cmd starten und die Prüfsummen kontrollieren.
4. INSTALL-WINDOWS.cmd starten. Keine Administratorrechte erforderlich.
5. TeamSpeak öffnen und unter Darstellung / Appearance das User Theme aktualisieren und OCB Obsidian Glass RC10 auswählen. Bezeichnungen können je nach Client-Version abweichen.

Standardziel: %APPDATA%\TeamSpeak\Default\extensions\gg.ocb.obsidian
Für andere Profile den Ordner gg.ocb.obsidian manuell in deren extensions-Verzeichnis kopieren. package.json liegt direkt im Theme-Ordner.

## Update
Erneut installieren. Die bisherige Version wird vor dem Austausch in ocb-theme-backups neben dem extensions-Ordner gesichert. Der Installer überprüft die kopierten Dateien; bei einem Fehler beim abschließenden Verschieben wird die vorherige Version wiederhergestellt, sofern das Ziel frei ist.

## Deinstallation
In TeamSpeak zunächst ein anderes Theme auswählen, dann den Client schließen und UNINSTALL-WINDOWS.cmd starten. Das OCB-Theme wird in den Backup-Ordner verschoben. Server und Benutzereinstellungen werden nicht entfernt.

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

RC10 nutzt ein zusammenhaengendes Wellenbild hinter dem Kanalbaum. Einzelne serverseitige Kanalbilder werden lokal ausgeblendet, einschliesslich eventuell darin eingebauter Texte/Logos; native Kanalnamen, Icons und der Server-Kopfbanner bleiben sichtbar. Bei deaktiviertem Theme erscheinen die Serverbilder wieder.
