insert into pesa2019.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'default_experiment_restriction', 'y'
from pesa2019.or_options;

insert into pesa2019.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'use_first_experimenters_mail_as_sender_mail', 'y'
from pesa2019.or_options;

insert into pesa2019.or_options (option_id, option_type, option_name, option_value) 
select max(option_id)+1 ,'general', 'use_experimenters_mail_as_default', 'y'
from pesa2019.or_options;