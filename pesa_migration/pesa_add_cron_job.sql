insert into ##new_db##.or_cron_jobs values('check_for_finished_sessions', 'y', 'every_15_minutes', '0');
insert into ##new_db##.or_cron_jobs values('check_for_finished_experiments', 'y', 'every_15_minutes', '0');
insert into ##new_db##.or_cron_jobs values('delete_old_experiments', 'y', 'every_day_at_3', '0');
