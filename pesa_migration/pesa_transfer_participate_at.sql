ALTER TABLE ##old_db##.or_participate_at ADD invited_tiny TINYINT(1);

ALTER TABLE ##new_db##.or_participate_at DROP INDEX uindex2,
ADD UNIQUE INDEX uindex2 (participant_id ASC, experiment_id ASC, session_id ASC);

update ##old_db##.or_participate_at set invited_tiny = IF(invited='y',1,0);

alter table ##old_db##.or_participate_at add pstatus_id int(20);
update ##old_db##.or_participate_at set pstatus_id = 3 where shownup='n' and participated='n';
update ##old_db##.or_participate_at set pstatus_id = 3 where shownup='n' and participated='y';
update ##old_db##.or_participate_at set pstatus_id = 2 where shownup='y' and participated='n';
update ##old_db##.or_participate_at set pstatus_id = 1 where shownup='y' and participated='y';

insert into ##new_db##.or_participate_at(participate_id, participant_id, experiment_id, invited, 
session_id, pstatus_id) 
select participate_id, participant_id, experiment_id, invited_tiny, session_id, pstatus_id from ##old_db##.or_participate_at
where experiment_id in (select experiment_id from ##new_db##.or_experiments)
      and participant_id in (select participant_id from ##new_db##.or_participants);


