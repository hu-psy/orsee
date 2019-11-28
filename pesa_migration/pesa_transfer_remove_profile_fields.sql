/* delete rows in or_profile_fields */
delete from ##new_db##.or_profile_fields where mysql_column_name in ('begin_of_studies', 'field_of_studies', 'fname', 'lname', 'phone_number', 'profession');

/* delete columns which arn't used anymore. note: mariadb removes indexes automatically */
alter table ##new_db##.or_participants
    drop column begin_of_studies,
    drop column field_of_studies,
    drop column fname,
    drop column lname,
    drop column phone_number,
    drop column profession;
