insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de) 
select max(lang_id)+1 ,'y', '-1', 'public_content', 'privacy_policy_for_admins', (select en from ##new_db##.or_lang where lang_id='430009'), (select de from ##new_db##.or_lang where lang_id='430009')
from ##new_db##.or_lang;
