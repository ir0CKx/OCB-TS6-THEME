# Änderungen

## 1.0.0-rc.3
- Veröffentlichungspaket mit Anleitung, Integritätsprüfung und dokumentiertem Teststatus.
- Originalbanner auch im optionalen Server-Asset-ZIP ergänzt.
- Originaler 2172 × 724 OCB-Banner mit proportionaler 3:1-Fläche.
- Glastextur über die gesamte Fensterhöhe mit weicher Abdunklung.
- Proportionale Kanalbanner ohne abgeschnittene Bildränder.
- Native Schrift, Fokusmarkierungen und Auswahlzustände; keine versteckten Bedienelemente per display:none oder visibility:hidden.
- Installer mit Kopierprüfung und Backup; Deinstallation durch Verschieben in eine Sicherung.

## 1.0.0-rc.3 – Erkennung im Client
TS6 begrenzt Einzeldateien einer Erweiterung auf 2 MiB. Header und Glastextur liegen jetzt als verlustfreies WebP darunter. Aufloesung und dekodierte RGBA-Pixel sind identisch mit den PNG-Quellen. Der Installer prueft diese Grenze vor der Installation.

## 1.0.0-rc.4 – Weiche Uebergaenge
Kopfbanner blendet oben und unten weich in den Hintergrund. Kanalbanner erhalten schmale vertikale Randverlaeufe. Harte dekorative Rahmen entfernt; Glastextur in Kanalzeilen am Fensterhintergrund ausgerichtet. Nur Bildhintergruende werden maskiert, native Texte und Bedienelemente bleiben unveraendert.

Bereichstrenner mit dezenter Silberflaeche, klare Hover-/Auswahlzustaende und bessere Lesbarkeit der nativen Header-Texte. Native Zeilenhoehen und Einrueckungen werden beibehalten, um den virtualisierten Kanalbaum nicht zu verschieben.

## 1.0.0-rc.5 – Member-Lounges
Fallback-Glastextur fuer die native tsv-item-highlight-Ebene von Kanaelen ohne eigenen Banner. Gilt auch ohne alwaysShowChannelBackground. Vorhandene Serverbanner und Benutzerzeilen behalten ihre bisherigen Regeln.

## 1.0.0-rc.6 – Oberflaechen und Bedienbarkeit
Neutralere Flaechen, durchgaengige Kontextmenue-Farben, solide Menues ohne Hintergrund-Blur, erkennbare Eingabefelder und Platzhalter, Tastaturfokus fuer editierbare Felder und fokussierbare Eintraege. Scrollleisten 8 px. Bewegungsreduktion wird fuer Theme-Uebergaenge beachtet. Semantische Warn-/Fehler-/Sprechfarben und native Geometrie bleiben erhalten.

## 1.0.0-rc.7 – Eindeutig neu ladbare Version
Neuer CSS-Dateiname obsidian-rc7.css und sichtbarer Theme-Name OCB Obsidian Glass RC7. Gestaltung entspricht RC6. Nach dem Aktualisieren das neue Theme explizit auswaehlen.

## 1.0.0-rc.8 – Anpassung an den Live-Screenshot
TS6-Kanalbaum-Verlauf abgedunkelt, Mitgliederflaechen beruhigt, Bildbanner-Kontrast reduziert und nativer Servername an die untere Bannerkante versetzt. Eigene Bilddateien und native Kanalgeometrie unveraendert.

## 1.0.0-rc.9 – Aktuelle TS6-Navigation
Aktuelle tsv-sidebar statt nur alter ts-sidebar-Klassen erfasst. Navigation, obere Leiste, Suche, Profilbereich, Karten, Einstellungen und gefuellte Standardaktionen ueber die zusaetzlichen nativen TS6-Variablen gestaltet. Warn-/Fehler-/Onlinefarben unveraendert.

## 1.0.0-rc.10 – Durchgehender Kanalhintergrund
Eine gemeinsame Glas-/Wellentextur pro Kanalbaum-Ansicht. Einzelne Server-Kanalbanner werden fuer diese Darstellung lokal transparent geschaltet; die Serverdateien bleiben unveraendert. Native Icons und Texte bleiben sichtbar. Das Motiv reicht ueber die sichtbare Baumhoehe und wird nicht pro Zeile wiederholt.

## 1.0.0-rc.11 – 4K-Export und Standard-Servericons
Neue KI-verfeinerte 16:9-Wellentextur, Export 3840 x 2160 aus 1672 x 941 Quellpixeln (hochskaliert, kein natives 4K). Originalbanner und Bigcircle unveraendert. Nur generische Server-SVGs in der linken Sidebar ohne individuelle Bildebene werden durch Bigcircle ersetzt. Statusicons bleiben bestehen.
