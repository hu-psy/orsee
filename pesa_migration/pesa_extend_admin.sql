alter table ##new_db##.or_admin add privacy_policy_accepted char(1);
update ##new_db##.or_admin set privacy_policy_accepted='n';

alter table ##new_db##.or_admin add column expiration_date date default date_add(now(), interval 1 year);
alter table ##new_db##.or_admin add column expiration_warning_sent boolean default FALSE;

/* add trigger to automatically reset expiration_warning_sent if expiration_date is changed */
delimiter //
create trigger reset_expiration_warning_sent
       before update on ##new_db##.or_admin
       for each row
       begin
         if not (old.expiration_date <=> new.expiration_date) then
           set new.expiration_warning_sent = FALSE;
         end if;
       end; //

delimiter ;
