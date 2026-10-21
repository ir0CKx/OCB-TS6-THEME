# Kompatibilität und Prüfgrenzen

Basis: Theme-API 1 sowie die Dokumentation und CSS-Regeln des lokal installierten TeamSpeak-6-Clients. Keine garantierte Kompatibilität mit allen zukünftigen TS6-Versionen; kein TS3-Theme.

Automatisiert geprüft: Manifest anhand der genutzten Schema-Eigenschaften, lokale Bildpfade, CSS-Laden, Kanalbild-Regeln im Zusammenspiel mit installiertem TS-CSS, Layout-Vorschau bei 100/200/300 Prozent. Windows-Installation, Update und Deinstallation werden in einem isolierten Testordner geprüft.

Noch live zu prüfen: Aktivierung im Client; Sprachkanäle, Mikrofon/Stummschaltung, Chat, Kontextmenüs, Einstellungen, Serververwaltung und Bildschirmfreigabe einschließlich Quellenwahl, Start/Stopp und Vollbild. Die statische Vorschau bildet diese Funktionen nicht vollständig ab.

Bildqualität: Originalbanner und Glastextur jeweils 2172 × 724 Pixel, Bigcircle 724 × 732. Der Banner ist verlustfrei als WebP umkodiert; seine dekodierten Bildpixel bleiben identisch. Flächige Hintergrundtexturen dürfen zur vollständigen Abdeckung großer Fenster skaliert und beschnitten werden. Der Kopfbanner bleibt im 3:1-Format. Echte zusätzliche Details entstehen beim Hochskalieren nicht. Schrift und CSS-Elemente werden nativ gerendert.

Keine externen Schriften, Skripte oder Netzwerkanfragen durch das Theme. Nur lokale Bilder und CSS. Kein automatisches Update und keine digitale Signatur; Prüfsummen prüfen Dateiintegrität, nicht die Identität des Herausgebers.
