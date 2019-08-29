update ##old_db##.or_lang set lang_id = lang_id + 220004 where content_type = "experimentclass";

insert into ##new_db##.or_lang(lang_id, enabled, content_type, content_name, en, de) 
select lang_id, enabled, content_type, content_name, en, de from ##old_db##.or_lang where content_type = "experimentclass";