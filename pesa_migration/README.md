# Anleitung zur Migration  von PESA

0. Mailserver deaktivieren (damit nicht versehentlich emails verschickt werden)
1. aktuellen hu-psy branch auschecken
2. Dump der alten Datenbank durchführen (da bei der Migration die alte Datenbank verändert wird)
3. Dump auf dem neuen Server importieren
4. .htaccess Datei vom alten Server kopieren und als htaccess im pesa_migration Ordner speichern
5. Texte aus Etherpad in pesa_migration/etherpad als txt und im richtigen Format speichern
6. pesa_migration/pesa_init.sh ausführen
7. pesa_migration/pesa_transfer.sh ausführen
8. (optional) für einen Testlauf des Systems die Skripte utils/set_experimenter.py (aktiveren der Experimentatoren, die testen sollen) und utils/set_emails.py (alle Teilnehmer gleiche Email) ausführen
9. (optional) für einen Testlauf die Authentifizierung für Teilnehmer auf URL-Token stellen
10. Mailserver wieder aktivieren
