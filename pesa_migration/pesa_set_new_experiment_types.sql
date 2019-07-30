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
