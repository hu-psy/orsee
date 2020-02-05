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
select max(lang_id)+1 ,'y', -1, 'mail', 'admin_expiration',
'Hello!

Your PESA account has expired. Please contact your PESA administrator if you still require access to PESA.

Regards,

PESA2019
',
'Hallo!

Ihr PESA-Account ist abgelaufen. Bitte kontaktieren Sie ihren PESA Administrator, falls Sie weiterhin Zugang zu PESA benötigen.

Mit freundlichen Gruessen,

PESA2019
'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'mail', 'admin_expiration_warning',
'Hello!

Your PESA account will expire on #expiration_date#. Please contact your PESA administrator if you still require access to PESA.

Regards,

PESA2019
',
'Hallo!

Ihr PESA-Account wird am #expiration_date# ablaufen. Bitte kontaktieren Sie ihren PESA Administrator, falls Sie weiterhin Zugang zu PESA benötigen.

Mit freundlichen Gruessen,

PESA2019
'
from ##new_db##.or_lang;


insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'email_admin_expiration_subject', 'Your PESA account has been expired', 'Ihr PESA Account ist abgelaufen'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'email_admin_expiration_warning_subject', 'Your PESA account will expire soon', 'Ihr PESA Account läuft demnächst ab'
from ##new_db##.or_lang;
