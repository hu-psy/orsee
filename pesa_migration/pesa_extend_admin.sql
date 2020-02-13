alter table ##new_db##.or_admin add privacy_policy_accepted char(1);
update ##new_db##.or_admin set privacy_policy_accepted='n';

alter table ##new_db##.or_admin add column expiration_date date default date_add(now(), interval 1 year);
alter table ##new_db##.or_admin add column expiration_warning_sent boolean default FALSE;
