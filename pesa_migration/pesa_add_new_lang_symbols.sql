insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'participant_form_only_payment_description', "only payed experiments (you won't receive any invitations for experiments which compensate non-monetarily, e.g. with feedback or VP credits)", 'nur bezahlte Experimente (Sie erhalten keine Einladungen für Experimente, die nicht monetär entschädigen, z.B. durch Feedback oder VP-Marken'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'participant_form_only_online_description', 'only online experiments (you will only receive invitations for experiments which can be done online, i.e. no experiments in laboratories. Please notice that this option (if checked) will decrease the probability to participate in an experiment because this institute mainly uses laboratory experiments)', 'nur Onlineexperimente (Sie erhalten nur Einladungen für Experimente, die online durchgeführt werden können, d.h. keine Laborexperimente. Bitte beachten Sie, dass diese Option (falls angeklickt) die Wahrscheinlichkeit eingeladen zu werden reduziert, weil dieses Institut hauptsächlich Laborexperimente durchführt)'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'online_link', 'Link to experiment', 'Link zum Experiment'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'online_begin', 'Begin', 'Beginn'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'online_end', 'End', 'Ende'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'error_link_required_for_online_experiments', 'You have to enter a link to the online experiment.', 'Sie müssen eine Link für das Online-Experiment angeben.'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'error_begin_required_for_online_experiments', 'You have to enter valid begin date for the online experiment.', 'Sie müssen einen Starttermin für das Online-Experiment angeben.'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'error_end_required_for_online_experiments', 'You have to enter valid end date for the online experiment.', 'Sie müssen einen Endtermin für das Online-Experiment angeben.'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'gender_d', 'non-binary', 'divers'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang
select max(lang_id)+1 ,'y', -1, 'lang', 'gender_d_abbr', 'n', 'd' from ##new_db##.or_lang;

insert into ##new_db##.or_lang
select max(lang_id)+1 ,'y', -1, 'lang', 'year_of_birth', 'year of birth', 'Geburtsjahr' from ##new_db##.or_lang;

insert into ##new_db##.or_lang
select max(lang_id)+1 ,'y', -1, 'lang', 'you_have_to_year_of_birth', 'Please enter your year of birth.', 'Bitte geben Sie Ihr Geburtsjahr an.' from ##new_db##.or_lang;

insert into ##new_db##.or_lang
select max(lang_id)+1 ,'y', -1, 'lang', 'cancellation_end_hours_before', 'Cancellation deadline (hours before start)', 'Abmeldungsende (Stunden vor Experimentbeginn)' from ##new_db##.or_lang;

insert into ##new_db##.or_lang
select max(lang_id)+1 ,'y', -1, 'lang', 'cancellation_until', 'cancel until', 'Abmeldung bis' from ##new_db##.or_lang;
