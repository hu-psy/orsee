delete from ##new_db##.or_objects where item_type='result_table_assign';

insert into ##new_db##.or_objects(order_number, item_type, item_name, item_details)
values (0, 'result_table_assign', 'checkbox', ''),
       (1, 'result_table_assign', 'year_of_birth', ''),
       (2, 'result_table_assign', 'gender', '');
