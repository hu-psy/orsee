update ##new_db##.or_options set option_value = 'y' where (option_id = '1426010295'); /* allow experiment restriction */
update ##new_db##.or_options set option_value = 'y' where (option_id = '1426336392'); /* subject cancellation */
update ##new_db##.or_options set option_value = 'y' where (option_id = '1426010293'); /* require privacy acceptance */
update ##new_db##.or_options set option_value = 'y' where (option_id = '1426010292'); /* require rules acceptance */
update ##new_db##.or_options set option_value = 'migration' where (option_id = '1426010310'); /* subject authentication */
/* update pesa2019.or_options set option_value = '<insert-email-here>' where (option_id = '1426010269'); /* support mail */

/* enable noshow warnings */
update ##new_db##.or_options set option_value = 'y' where option_id='1426010300';
update ##new_db##.or_cron_jobs set enabled = 'y' where job_name="check_for_noshow_warnings";
