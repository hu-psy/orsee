delete from ##new_db##.or_subpools where (subpool_id = '2' or subpool_id = '3' or subpool_id = '4');
update ##new_db##.or_subpools set experiment_types = '|1|,|2|,|3|,|4|,|5|,|6|' ;