/* set new experiment types */
truncate table ##new_db##.or_experiment_types;

INSERT INTO `##new_db##`.`or_experiment_types` (`exptype_id`, `exptype_name`, `exptype_description`, `exptype_mapping`, `enabled`) VALUES ('1', 'LaboratoryWOP', 'normal laboratory eyperiments without payment', 'laboratory', 'y');
INSERT INTO `##new_db##`.`or_experiment_types` (`exptype_id`, `exptype_name`, `exptype_description`, `exptype_mapping`, `enabled`) VALUES ('2', 'LaboratoryP', 'normal laboratory eyperiments with payment', 'laboratory', 'y');
INSERT INTO `##new_db##`.`or_experiment_types` (`exptype_id`, `exptype_name`, `exptype_description`, `exptype_mapping`, `enabled`) VALUES ('3', 'Online-SurveyWOP', 'online survey experiments without payment', 'online-survey', 'y');
INSERT INTO `##new_db##`.`or_experiment_types` (`exptype_id`, `exptype_name`, `exptype_description`, `exptype_mapping`, `enabled`) VALUES ('4', 'Online-SurveyP', 'online survey experiments with payment', 'online-survey', 'y');

/* change experiment types in or_participants subscription */
alter table ##new_db##.or_participants add new_subs varchar(50);

update ##new_db##.or_participants set new_subs = '';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|2|') where subscriptions like '%1%';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|1|') where subscriptions like '%2%';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|3|') where subscriptions like '%5%';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|4|') where subscriptions like '%4%';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|1|,|2|') where subscriptions = '|3|';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|3|,|4|') where subscriptions = '|6|';
update ##new_db##.or_participants set new_subs = concat(new_subs,',|1|,|2|,|3|,|4|') where subscriptions = '|3|,|6|' or subscriptions = '|6|,|3|';

update ##new_db##.or_participants set subscriptions = substring(new_subs, 2);

alter table ##new_db##.or_participants drop column new_subs;

/* change experiment types in or_experiments */
alter table ##new_db##.or_experiments add new_subs varchar(50);

update ##new_db##.or_experiments set new_subs = '';
update ##new_db##.or_experiments set new_subs = concat(new_subs,',|2|') where experiment_ext_type like '%1%';
update ##new_db##.or_experiments set new_subs = concat(new_subs,',|1|') where experiment_ext_type like '%2%';
update ##new_db##.or_experiments set new_subs = concat(new_subs,',|3|') where experiment_ext_type like '%5%';
update ##new_db##.or_experiments set new_subs = concat(new_subs,',|4|') where experiment_ext_type like '%4%';

update ##new_db##.or_experiments set experiment_ext_type = substring(new_subs, 2);

alter table ##new_db##.or_experiments drop column new_subs;

delete from ##new_db##.or_lang where content_type='experiment_type';

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1, 'y','-1', 'experiment_type', 1, 'laboratory experiments without payment','Laborexperimente ohne Bezahlung' from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1, 'y','-1', 'experiment_type', 2, 'laboratory experiments with payment','Laborexperimente mit Bezahlung' from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1, 'y','-1', 'experiment_type', 3, 'online survey experiments without payment','Internt-Experimente ohne Bezahlung' from ##new_db##.or_lang;

insert into ##new_db##.or_lang (lang_id, enabled, order_number, content_type, content_name, en, de)
select max(lang_id)+1, 'y','-1', 'experiment_type', 4, 'online survey experiments with payment','Internet-Experimente mit Bezahlung' from ##new_db##.or_lang;

update ##new_db##.or_subpools set experiment_types='|1|,|2|,|3|,|4|' where (subpool_id = '1');
