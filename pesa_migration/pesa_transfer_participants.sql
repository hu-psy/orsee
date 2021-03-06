/* subsciptions in or_participants uses |<exptype_id1>|, |<exptype_id2>| and not exptype_name */
/* drop table ##new_db##.numbers; */
create temporary table ##new_db##.numbers (N int1);
insert into ##new_db##.numbers values (1),(2),(3),(4),(5),(6);
/*select * from numbers;*/

/* drop table ##new_db##.b; */
create temporary table ##new_db##.b (participant_id int(20), new_subs varchar(50));
/* TODO: remove ignore */
insert ignore into ##new_db##.b (participant_id, new_subs)
select participant_id,  group_concat(concat('|',exptype_id,'|') separator ',') 
from (
  (select participant_id, substring_index(substring_index(subscriptions, ',', N), ',', -1) as subs
   from ##old_db##.or_participants 
   join ##new_db##.numbers
   on char_length(subscriptions) - char_length(replace(subscriptions, ',', '') >= N-1)
   group by participant_id, subs) as a
  join ##new_db##.or_experiment_types as b
  on a.subs = b.exptype_name
)
group by participant_id;

alter table ##old_db##.or_participants
	add new_subs varchar(50);

update ##old_db##.or_participants as a 
join ##new_db##.b as b 
on a.participant_id = b.participant_id 
set a.new_subs = b.new_subs 
where a.participant_id = b.participant_id;

alter table ##new_db##.or_participants add column year_of_birth int(4) not null;

insert into ##new_db##.or_participants(participant_id, participant_id_crypt, subpool_id, email, subscriptions, gender, number_reg, number_noshowup, rules_signed, `language`, year_of_birth)
select participant_id, participant_id_crypt, subpool_id, email, new_subs, gender, number_reg, number_noshowup, rules_signed, `language`, cast(year_of_birth as int)
from ##old_db##.or_participants
where participant_id in (
          select distinct participant_id
          from ##old_db##.or_participate_at
          where session_id in (select session_id from ##new_db##.or_sessions)
      );

/* set status_id to 1 */
update ##new_db##.or_participants set status_id=1;

/* set deleted and excluded ones to excluded state */
update ##new_db##.or_participants set status_id=3
where participant_id in (
    select participant_id
    from ##old_db##.or_participants
    where deleted = "y"
          or excluded = "y"
          or unsuitable = "y"
);
