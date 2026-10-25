# OCB.GG Obsidian Glass

TeamSpeak-6-Client-Theme von **#OTHERSCANTBEAT / OCB.GG**. Dunkle Oberflächen, silberne Akzente, originaler OCB-Kopfbanner und ein durchgehendes Glas-/Wellenmotiv hinter dem Kanalbaum.

**Aktuelle Version: 1.0.0-rc.15** · Windows-Installer inklusive.

[**Download: vollständiges Theme-Paket**](https://github.com/ir0CKx/OCB-TS6-THEME/raw/refs/heads/main/downloads/OCB-Obsidian-Glass-1.0.0-rc.15.zip)

## Installation unter Windows
1. Das verlinkte ZIP herunterladen und vollständig entpacken.
2. TeamSpeak 6 vollständig beenden.
3. `INSTALL-WINDOWS.cmd` starten. Keine Administratorrechte erforderlich.
4. TeamSpeak öffnen und unter **Darstellung / Appearance → Benutzer-Theme / User Theme** die Theme-Liste aktualisieren.
5. **OCB Obsidian Glass RC15** auswählen.

Bei einem Update zunächst das Standardtheme auswählen und anschließend RC15 aktivieren. Der Installer sichert die bisherige OCB-Version. Deinstallation: anderes Theme aktivieren, Client schließen, `UNINSTALL-WINDOWS.cmd` starten.

Manuell nur den Ordner **gg.ocb.obsidian** nach `%APPDATA%\TeamSpeak\Default\extensions` kopieren. Nicht den gesamten Repository-Ordner als Erweiterung ablegen. Der Ordnername muss exakt zur Kennung passen.

[Ausführliche Anleitung](INSTALLATION-DE.md) · [Nutzungsbedingungen](NUTZUNGSBEDINGUNGEN-DE.md) · [Änderungen](CHANGELOG.md)

## Vorschau
Die folgende Abbildung ist eine **statische Layout-Testansicht**, kein Live-Screenshot. Die tatsächliche Anordnung hängt von Client-Version, Fenstergröße, Server und Skalierung ab.

![Statische OCB-Layout-Testansicht](VORSCHAU.png)

## Gestaltung und Funktionen
- Durchgehendes Wellenmotiv über die sichtbare Kanalbaum-Fläche statt wiederholter Einzelbanner.
- Dunkle Navigation, Suche, Profilbereich, Menüs und Karten.
- Sichtbarer Tastaturfokus, lesbare Eingabefelder und Unterstützung für reduzierte Bewegung.
- Generische Servericons in der linken Navigation werden durch OCB-Bigcircle ersetzt; individuelle Logos und Statusanzeigen bleiben erhalten.
- Originaler OCB-Kopfbanner und Bigcircle; native Kanalnamen, Nutzerbilder und Gruppenicons bleiben erhalten.

**RC15 blendet serverseitige Kanalbildbanner lokal aus**, damit das zusammenhängende Wellenmotiv sichtbar ist. Darin eingebettete Texte oder Logos werden ebenfalls ausgeblendet. Die Serverdateien werden nicht verändert; mit dem Standardtheme erscheinen sie wieder. Das optionale Server-Asset-ZIP ist separat enthalten.

Sprachchat, Bildschirmfreigabe und Serverrechte werden von TeamSpeak bereitgestellt. Das Theme fügt diese Funktionen nicht hinzu und ändert keine Berechtigungen.

## Qualität und Teststand
Theme-Erkennung wurde im Client bestätigt; die RC10-Gestaltung wurde vom Auftraggeber akzeptiert; RC15 ist noch live zu prüfen. Automatische Prüfungen umfassen Manifest, lokale Dateien, CSS, ausgewählte Komponenten, Skalierungen und die TS6-Grenze von **2 MiB je Erweiterungsdatei**. Der Originalbanner bleibt pixelidentisch verlustfrei gespeichert. Die neue Wellentextur ist ein **hochskalierter 4K-Export (3840 × 2160)** aus einer KI-generierten Quelle mit 1672 × 941 Pixeln, kein natives 4K. WebP-Qualität 96, 1.254.124 Bytes. Der Export schafft keine zusätzlichen nativen Details.

Windows-Installation wurde getestet, Linux/macOS nicht. Details: [Kompatibilität](KOMPATIBILITAET.md).

`VERIFY-WINDOWS.cmd` prüft die Dateien anhand von `SHA256SUMS.txt`. Prüfsummen bestätigen Integrität, keine Herausgeberidentität.

## Lizenz und Rückmeldungen
Kostenlose Nutzung gemäß [LICENSE.txt](LICENSE.txt), auch im kommerziellen Umfeld. Kein Weiterverkauf und keine eigenständige Nutzung der OCB-Marken oder Logos. Dies ist eine proprietäre Nutzungsfreigabe, keine uneingeschränkte Open-Source-Lizenz.

Fehler bitte über [GitHub Issues](https://github.com/ir0CKx/OCB-TS6-THEME/issues) mit Client-Version, Betriebssystem, Skalierung und reproduzierbaren Schritten melden. Private Daten in Screenshots vorher entfernen.

Eigenständiges Community-Theme, kein offizielles Produkt von TeamSpeak.

## Nutzeransicht ab RC15
Die bisherigen silbernen TS6-Akzente bleiben erhalten. Reihenfolge: Nutzerbild, verfügbare Kontaktaktion, Nutzertag, gemeinsame Karte für Verbindung und Standort, Gruppen, Abzeichen, weitere native Statusinformationen, Identität. Der vorhandene UID-Eintrag steht am Ende des Fußbereichs. Client-ID und Datenbank-ID bleiben im nativen UID-Tooltip verfügbar, nicht als neue Textzeilen. Gruppen sind in TS6 eine gemeinsame Karte; die interne Reihenfolge bleibt nativ. Das Original-Bigcircle erscheint als 44-Pixel-Wasserzeichen mit 24 % Deckkraft am unteren rechten Ende des Nutzerinhalts und blockiert keine Klicks.

Dies ist eine CSS-Anpassung, keine Übernahme der TS3-Templates: fehlende Nutzerdaten werden nicht abgerufen, Status-/Sprachberechtigungsanzeigen bleiben funktionsfähig. `[cspacer]` wird nicht durch Textersetzung gefiltert. Die Selektoren wurden mit der lokal installierten TS6-Oberfläche abgeglichen; die Layoutprüfung nutzt eine statische Testansicht, keinen verbundenen Live-Client.
