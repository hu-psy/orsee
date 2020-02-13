insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'default_experiment_restriction', 'y'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'use_first_experimenters_mail_as_sender_mail', 'n'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'use_experimenters_mail_as_default', 'y'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'default', 'session_cancellation_end_hours_default', '24'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'default', 'session_cancellation_end_hours_steps', '12'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'default', 'session_cancellation_end_hours_max', '240'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value)
select max(option_id)+1 ,'default', 'include_cancel_until_in_invitation', 'y'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value)
select max(option_id)+1 ,'default', 'include_cancel_until_on_enrolment_page', 'y'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'maximum_assignments', '400'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'delete_finished_experiments_after', '1095'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value)
select max(option_id)+1 ,'general', 'finished_experiment_limit', '28'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'admin_expiration_objection_period', '30'
from ##new_db##.or_options;

insert into ##new_db##.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'admin_delete_expired_account_limit', '365'
from ##new_db##.or_options;
