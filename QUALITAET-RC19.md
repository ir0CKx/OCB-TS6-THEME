# RC19 – Bereinigung und Prüfstand

25. Oktober 2026. Neuer Anzeigename: **OCB.GG - Glass & Dark Theme v1.0.0-rc.19**. Interne Kennung unverändert: `gg.ocb.obsidian`.

## Änderungen

- Fünf überholte CSS-Blöcke entfernt: frühere Hintergrundgrößen, ein später überschriebener HiDPI-Block, alter Baumhintergrund und doppelte Navigationsdekoration. Der wirksame Seitenrahmen bleibt erhalten.
- Stabile CSS-Datei `obsidian.css`; der Anzeigename folgt der gewünschten Versionsnummer. Beim Umstieg einmal neu auswählen. Automatische Auswahl-Erhaltung in späteren TS6-Versionen wird nicht garantiert.
- Historische Testbilder und Berichte in `docs/archive` archiviert. Release-Downloads, Originalgrafiken und bestehende Installationssicherungen bleiben erhalten.
- Installer entfernt im Fehlerfall ausschließlich seinen selbst erzeugten Zwischenordner. Paketprüfung weist zusätzliche Theme-Dateien, doppelte Prüfsummeneinträge und verlinkte Theme-Dateien zurück. Deinstallation prüft, ob TeamSpeak läuft.

## Tests

220 Komponentenfälle bestanden: Chat 120, Nutzerkarten 24, Medien/Code 20, Channel-Überschrift 20 und Stream-Emojis 36. Es sind Browser-Fixtures, keine 220 realen Monitore. Die RC18-Live-Prüfung im maximierten Client und der bestätigte RC17-Streamempfang sind im vorherigen Bericht dokumentiert.

Der Windows-Explorer-Startabsturz ist weiterhin nicht eindeutig auf eine Theme-Datei zurückgeführt und nicht als behoben bestätigt. Dieses Paket verändert keine Explorer-Einstellungen. Originalbanner und bestehende Grafikauflösung bleiben unverändert.

Zusätzlich bestanden: neun isolierte Installer-Szenarien (einschließlich zusätzlicher Dateien, doppelter Prüfsummen, laufendem Client, sauberem Austausch, Rollback und Zwischenordner-Bereinigung). Die wirksame Hintergrunddarstellung stimmt in Vergleichs-Fixtures bei 1×/2×/3× Pixeldichte mit RC18 überein. Die Texte der grafischen Anleitung liegen innerhalb der Zeichenfläche. RC19 wurde nicht erneut als Live-Stream übertragen.
