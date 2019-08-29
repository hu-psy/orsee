insert into ##new_db##.or_bulk_mail_texts(bulktext_id, bulk_id, lang, bulk_subject, bulk_text) 
select bulktext_id, bulk_id, lang, bulk_subject, bulk_text
from ##old_db##.or_bulk_mail_texts 