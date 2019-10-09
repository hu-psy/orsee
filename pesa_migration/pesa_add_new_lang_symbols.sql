insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'participant_form_only_payment_description', "only payed experiments (you won't receive any invitations for experiments which compensate non-monetarily, e.g. with feedback)", 'nur bezahlte Experimente (Sie erhalten keine Einladungen für Experimente, die nicht monetär entschädigen, z.B. durch Feedback'
from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1 ,'y', -1, 'lang', 'participant_form_only_online_description', 'only online experiments (you will only receive invitations for experiments which can be done online, i.e. no experiments in laboratories. Please notice that this option (if checked) will decrease the probability to participate in an experiment because this institute mainly uses laboratory experiments)', 'nur Onlineexperimente (Sie erhalten nur Einladungen für Experimente, die online durchgeführt werden können, d.h. keine Laborexperimente. Bitte beachten Sie, dass diese Option (falls angeklickt) die Wahrscheinlichkeit eingeladen zu werden reduziert, weil dieses Institut hauptsächlich Laborexperimente durchführt)'
from ##new_db##.or_lang;
