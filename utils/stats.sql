select count(distinct(participant_id)) from
	(select session_id from or_sessions where session_start_year='2019') as a
    join (select participant_id, session_id from or_participate_at where participated='y') as b
    on a.session_id = b.session_id;
    
select count(b.session_id) from
	(select session_id from or_sessions where session_start_year='2017') as a
	join (select participant_id, session_id from or_participate_at) as b
    on a.session_id = b.session_id;
    
select count(distinct(session_id)) from or_participate_at;

select count(session_id) from or_sessions where session_start_year='2019' and session_finished='y';

/* get participants which successivley participate in 17/18/19 */
drop table Test1718;
create table Test1718 (participant_id int, session_start_year int);
insert into Test1718
select distinct participant_id, session_start_year
	from or_participate_at
	join or_sessions
    on or_participate_at.session_id = or_sessions.session_id
    where participated	='y'
		and (
			session_start_year='2019'
            or session_start_year='2018'
            or session_start_year='2017'
		);

select count(*)
	from (
		select participant_id
			from Test1718
			where session_start_year='2019'
				or session_start_year='2018'
				/*or session_start_year='2017'*/
			group by participant_id
			having count(*)=2 /*3*/
	) as a;
        
select * from or_participate_at where session_id = 0;

select * from or_experiments as a where exists (select * from or_sessions as b where a.experiment_id = b.experiment_id and b.session_start_year = '2017'); /* alle experimente die eine session in 2017 gaben */
select participant_id from or_participate_at as a where exists (select * from or_sessions as b where a.session_id = b.session_id and b.session_start_year = '2018') and participated='y'; /* alle teilnehmer, die in 2018 teilgenommen haben */

select participant_id, invited, session_id
	from or_experiments as a 
    join or_participate_at as b
    on a.experiment_id = b.experiment_id
    where invited = 'y' and session_id = 0/* invited but not registered */
		 /* alle experimente die eine session in 2018 haben */
		and exists (select * from or_sessions as c where a.experiment_id = c.experiment_id and c.session_start_year = '2018')
        /* participant_id hat in 2018 nicht teilgenommen */
        and b.participant_id not in (select participant_id from or_participate_at as d where exists (select * from or_sessions as e where d.session_id = e.session_id and e.session_start_year = '2018') and d.participated='y')
        /* participant hat irgendwann in 2017 teilgenommen */
        and b.participant_id in (select participant_id from or_participate_at as f where exists (select * from or_sessions as g where f.session_id = g.session_id and g.session_start_year = '2017') and f.participated='y');
        
select count(*) from or_participate_at where session_id = 0 and invited = 'y'
