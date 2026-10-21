# OCB.GG Obsidian Glass

TeamSpeak-6-Client-Theme von **#OTHERSCANTBEAT / OCB.GG**. Dunkle Oberflächen, silberne Akzente, originaler OCB-Kopfbanner und ein durchgehendes Glas-/Wellenmotiv hinter dem Kanalbaum.

**Aktuelle Version: 1.0.0-rc.10** · Windows-Installer inklusive.

[**Download: vollständiges Theme-Paket**](https://github.com/ir0CKx/OCB-TS6-THEME/raw/refs/heads/main/downloads/OCB-Obsidian-Glass-1.0.0-rc.10.zip)

## Installation unter Windows
1. Das verlinkte ZIP herunterladen und vollständig entpacken.
2. TeamSpeak 6 vollständig beenden.
3. `INSTALL-WINDOWS.cmd` starten. Keine Administratorrechte erforderlich.
4. TeamSpeak öffnen und unter **Darstellung / Appearance → Benutzer-Theme / User Theme** die Theme-Liste aktualisieren.
5. **OCB Obsidian Glass RC10** auswählen.

Bei einem Update zunächst das Standardtheme auswählen und anschließend RC10 aktivieren. Der Installer sichert die bisherige OCB-Version. Deinstallation: anderes Theme aktivieren, Client schließen, `UNINSTALL-WINDOWS.cmd` starten.

Manuell nur den Ordner **gg.ocb.obsidian** nach `%APPDATA%\TeamSpeak\Default\extensions` kopieren. Nicht den gesamten Repository-Ordner als Erweiterung ablegen. Der Ordnername muss exakt zur Kennung passen.

[Ausführliche Anleitung](INSTALLATION-DE.md) · [Nutzungsbedingungen](NUTZUNGSBEDINGUNGEN-DE.md) · [Änderungen](CHANGELOG.md)

## Vorschau
Die folgende Abbildung ist eine **statische Layout-Testansicht**, kein Live-Screenshot. Die tatsächliche Anordnung hängt von Client-Version, Fenstergröße, Server und Skalierung ab.

![Statische OCB-Layout-Testansicht](VORSCHAU.png)

## Gestaltung und Funktionen
- Durchgehendes Wellenmotiv über die sichtbare Kanalbaum-Fläche statt wiederholter Einzelbanner.
- Dunkle Navigation, Suche, Profilbereich, Menüs und Karten.
- Sichtbarer Tastaturfokus, lesbare Eingabefelder und Unterstützung für reduzierte Bewegung.
- Originaler OCB-Kopfbanner und Bigcircle; native Kanalnamen, Nutzerbilder und Gruppenicons bleiben erhalten.

**RC10 blendet serverseitige Kanalbildbanner lokal aus**, damit das zusammenhängende Wellenmotiv sichtbar ist. Darin eingebettete Texte oder Logos werden ebenfalls ausgeblendet. Die Serverdateien werden nicht verändert; mit dem Standardtheme erscheinen sie wieder. Das optionale Server-Asset-ZIP ist separat enthalten.

Sprachchat, Bildschirmfreigabe und Serverrechte werden von TeamSpeak bereitgestellt. Das Theme fügt diese Funktionen nicht hinzu und ändert keine Berechtigungen.

## Qualität und Teststand
Theme-Erkennung wurde im Client bestätigt; die RC10-Gestaltung wurde vom Auftraggeber akzeptiert. Automatische Prüfungen umfassen Manifest, lokale Dateien, CSS, ausgewählte Komponenten, Skalierungen und die TS6-Grenze von **2 MiB je Erweiterungsdatei**. Die beiden großen Grafiken sind verlustfrei als WebP gespeichert; ihre Bildpixel entsprechen den PNG-Quellen.

Keine vollständige Live-Abnahme aller Dialoge, Betriebssysteme oder Bildschirmfreigabe-Funktionen. Windows-Installation wurde getestet, Linux/macOS nicht. Details: [Kompatibilität](KOMPATIBILITAET.md).

`VERIFY-WINDOWS.cmd` prüft die Dateien anhand von `SHA256SUMS.txt`. Prüfsummen bestätigen Integrität, keine Herausgeberidentität.

## Lizenz und Rückmeldungen
Kostenlose Nutzung gemäß [LICENSE.txt](LICENSE.txt), auch im kommerziellen Umfeld. Kein Weiterverkauf und keine eigenständige Nutzung der OCB-Marken oder Logos. Dies ist eine proprietäre Nutzungsfreigabe, keine uneingeschränkte Open-Source-Lizenz.

Fehler bitte über [GitHub Issues](https://github.com/ir0CKx/OCB-TS6-THEME/issues) mit Client-Version, Betriebssystem, Skalierung und reproduzierbaren Schritten melden. Private Daten in Screenshots vorher entfernen.

Eigenständiges Community-Theme, kein offizielles Produkt von TeamSpeak.
