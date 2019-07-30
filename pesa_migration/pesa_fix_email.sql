UPDATE `##new_db##`.`or_lang` SET `en` = 'Hello #fname# #lname#!\n\nYou were registrated at the experiment participant recruitment system of the Department of Psychology of the Humboldt-Universität zu Berlin .\n\nYour Profile:\nFirstname: #lname#\nLastname: #fname#\nGender: #gender#\nMain field of studies: #field_of_studies#\nProfession: #profession#\nStudy start: #begin_of_studies#\nE-Mail-Address: #email#\nPhone number: #phone_number#\n\nYou will get invitations for:\n#invitations#                                         \n\nTo confirm your registration, please click on the following link:\n\n#registration_link#\n\nWith kind regards\n\nInstitut für Psychologie\nHumboldt-Universität zu Berlin\nhttp://www.psychologie.hu-berlin.de\n\nExperiments:\nhttp://pesa.psychologie.hu-berlin.de/pesa' WHERE (`lang_id` = '390022');
UPDATE `##new_db##`.`or_lang` SET `en` = 'Hi #fname# #lname#!\r\n\r\nThis is just a reminder.\r\n\r\nYou have registered for the Experiment:\n\n\\\"#experiment_name#\\\"\r\n\r\nat:\n#session_date#\r\n\nin the Laboratory:\n#lab_name#\r\n\r\nThe Laboratory is suited at\r\n#lab_address#\r\n\r\nPlease be in time.\r\n\r\nGreetings\r\n\r\nYour experimenters', `de` = 'Hallo #fname# #lname#!\r\n\r\nDies ist nur eine Erinnerungsmail.\r\n\r\nSie haben sich für das folgende Experiment registriert:\r\n\r\n\\\"#experiment_name#\\\"\r\n\r\nzum:\r\n#session_date#\r\n\r\nim Labor:\r\n#lab_name#\r\n\r\nDas Labor befindet sich:\r\n#lab_address#\r\n\r\nBitte kommen Sie pünktlich.\r\n\r\nVielen Dank\r\n\r\nIhre Experimentatoren' WHERE (`lang_id` = '390021');
UPDATE `##new_db##`.`or_lang` SET `en` = 'Hello #fname# #lname#!\r\n\r\nWe are pleased that in the meantime many interested people have found their way to us. Unfortunately, there are always reasons why appointments cannot be made. However, we do not want to give a blanket \"not published\" and thus possibly risk the participation in further experiments. For this reason, the experimenters have agreed not to make this entry if the participant cancels the test for a reason before the test date. We hope to make the system as fair as possible.\n\r\nOf course we are endeavoured to constantly improve our service. We are looking forward to any feedback from you and hope you will continue to enjoy our experiments!\n\nbest regards\n\nyour experimenters\r\n' WHERE (`lang_id` = '390019');
UPDATE `##new_db##`.`or_lang` SET `en` = 'Hello #fname# #lname#!\r\n\r\nYou have registered for the following experiment:\r\n\r\nName: #experiment#\r\nDate and Time: #session#\r\nLaboratory: #lab_name#\r\nLab location:\r\n#lab_address#\r\n\r\nPlease arrive on schedule.\r\n\r\n\r\nSo long\r\n\r\nYour Experimenters', `de` = 'Hallo #fname# #lname#!\r\n\r\nSie haben sich fuer das folgende Experiment angemeldet:\r\n\r\nName: #experiment#\r\nDatum und Zeit: #session#\r\nLabor: #lab_name#\r\nOrt:\r\n#lab_address#\r\n\r\n\r\nDieser Termin ist verbindlich. Bitte erscheinen Sie puenktlich.\r\n\r\nVielen Dank und mit freundlichen Gruessen\r\n\r\nIhre Experimentatoren' WHERE (`lang_id` = '390016');
UPDATE `##new_db##`.`or_lang` SET `en` = 'Hello!\n\nA participant has registered for the following experiment:\n\nParticipant: #fname# #lname#\nExperiment: #experiment#\nDate and Time: #session#\nLaboratory: #lab_name#\nLab location:\n#lab_address#\n\nSo long\n\nPESA2019' WHERE (`lang_id` = '650013');