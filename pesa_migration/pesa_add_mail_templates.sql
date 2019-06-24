insert into pesa2019.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
select max(lang_id)+1 ,'y', -1, 'mail', 'admin_experiment_registration', 'Hello!

A participant has registered for the following experiment:

Participant: #fname# #lname#
Experiment: #experiment#
Date and Time: #session#
Laboratory: #laboratory#
Lab location:
#location#

So long

PESA2019', 'Hallo!

Ein Probant hat sich fuer das folgende Experiment angemeldet:

Probant: #fname# #lname#
Experiment: #experiment#
Datum und Zeit: #session#
Labor: #laboratory#
Ort:
#location#

Mit freundlichen Gruessen

PESA2019
'
from pesa2019.or_lang;

insert into pesa2019.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
select max(lang_id)+1 ,'y', -1, 'mail', 'admin_experiment_enrolment_cancellation', 'Hello!

A participant has *canceled* their enrolment for the following experiment session:

Participant: #fname# #lname#
Experiment: #experiment#
Date and Time: #session#
Laboratory: #lab_name#
Lab location:
#lab_address#

Regards,

PESA2019
', 'Hallo!

Ein Probant hat sich fuer das folgende Experiment *abgemeldet*:

Probant: #fname# #lname#
Experiment: #experiment#
Datum und Zeit: #session#
Labor: #lab_name#
Ort:
#lab_address#

Mit freundlichen Gruessen

PESA2019
'
from pesa2019.or_lang;