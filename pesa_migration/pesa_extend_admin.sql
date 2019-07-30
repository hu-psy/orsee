alter table ##new_db##.or_admin add privacy_policy_accepted char(1);
update ##new_db##.or_admin set privacy_policy_accepted='n';
