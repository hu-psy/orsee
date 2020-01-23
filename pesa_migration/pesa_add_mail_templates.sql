insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
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

Ein Proband hat sich fuer das folgende Experiment angemeldet:

Proband: #fname# #lname#
Experiment: #experiment#
Datum und Zeit: #session#
Labor: #laboratory#
Ort:
#location#

Mit freundlichen Gruessen

PESA2019
'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
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

Ein Proband hat sich fuer das folgende Experiment *abgemeldet*:

Proband: #fname# #lname#
Experiment: #experiment#
Datum und Zeit: #session#
Labor: #lab_name#
Ort:
#lab_address#

Mit freundlichen Gruessen

PESA2019
'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
select max(lang_id)+1 ,'y', -1, 'mail', 'public_inactivity_warning', 
'Hello!

Your account seems to be inactive since #last_activity#.
If you are stil interested in participating experiments, please log into your PESA account.
Otherwise your account will be deleted in one month.

Regards,

PESA2019',
'Hallo!

Ihr Account scheint seit dem #last_activity# inaktiv zu sein.
Wenn Sie weiterhin an der Teilnahme an Experimenten interessiert sind, loggen Sie sich bitte in PESA ein.
Andernfalls wird Ihr Konto in einem Monat gelöscht.

Mit freundlichen Gruessen

PESA2019
'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
select max(lang_id)+1 ,'y', -1, 'lang', 'email_inactivity_warning_subject', 'PESA is missing you!', 'PESA vermisst dich!'
from ##new_db##.or_lang;
