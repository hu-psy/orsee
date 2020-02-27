# Anleitung zur Migration  von PESA

1. aktuellen hu-psy branch auschecken
2. Dump der alten Datenbank durchführen (da bei der Migration die alte Datenbank verändert wird)
3. Dump auf dem neuen Server importieren
4. .htaccess Datei vom alten Server kopieren und als htaccess im pesa_migration Ordner speichern
5. Texte aus Etherpad in pesa_migration/etherpad speichern
6. pesa_migration/pesa_init.sh ausführen
7. pesa_migration/pesa_transfer.sh ausführen
