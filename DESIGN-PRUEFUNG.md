# Design-Abgleich RC6
Referenz: https://community.teamspeak.com/t/amoled-dark-minimalistic-teamspeak-6/63416
Übernommen als Gestaltungsprinzip: konsistente Oberflächen, klare Hierarchie, ruhige Chatflächen, einheitliche Menüs. Kein Quellcode oder Artwork der Referenz übernommen.

OCB behält den Originalbanner und die Glasstruktur. Menüs sind deckend, damit darunterliegende Banner nicht die Lesbarkeit stören. Scrollleisten bleiben 8 statt 4 Pixel breit. Texte, Schriftgröße, Einrückungen, Klickflächen und die native Geometrie des Kanalbaums werden nicht verkleinert. Statusfarben für Warnungen, Fehler und Sprache werden nicht auf Silber vereinheitlicht.

Statische Kontrastwerte und Komponentenprüfungen stehen im PRUEFBERICHT.json. Sie sind keine vollständige Barrierefreiheitsprüfung des Clients. Kontextmenüs, Einstellungen, Bildschirmfreigabe und kleine Fenster müssen weiterhin im tatsächlichen Client geprüft werden.
