truncate table ##new_db##.or_faqs;
delete from ##new_db##.or_lang where content_type='faq_question' or content_type='faq_answer';

insert into ##new_db##.or_faqs(faq_id, evaluation) 
select faq_id, evaluation from ##old_db##.or_faqs;

update ##old_db##.or_lang set lang_id = lang_id + 220004 where content_type = "faq_question" or content_type = "faq_answer";

insert into ##new_db##.or_lang(lang_id, enabled, content_type, content_name, en, de) 
select lang_id, enabled, content_type, content_name, en, de from ##old_db##.or_lang where content_type = "faq_question" or content_type = "faq_answer";

