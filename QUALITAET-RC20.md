# RC20 – Korrektur der Theme-Erkennung

Ursache im lokalen TeamSpeak-Protokoll bestätigt: content/themes/0/name überschritt 30 Zeichen. Zielordner war korrekt. Namen gegen die mit dem installierten Client ausgelieferten Grenzen geprüft. CSS und Grafiken unverändert gegenüber RC19. Die bisherigen Layouttests ersetzen keine Prüfung der Erweiterungs-Metadaten.

Prüfung bestanden: vollständiges offizielles extensions.json-Schema des installierten Clients; RC19-Fehler im Regressionstest erkannt; RC20 lokal installiert und alle Theme-Dateien mit dem Paket bytegleich verglichen. Keine Live-UI-Prüfung in diesem Korrekturlauf.
