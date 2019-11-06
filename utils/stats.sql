/* number of participants which participated at sessions in year X */
select count(distinct(participant_id)) from
	(select session_id from or_sessions where session_start_year='2019') as a
    join (select participant_id, session_id from or_participate_at where participated='y') as b
    on a.session_id = b.session_id;
    
/* number of participants which registered at sessions in year X */
select count(distinct(participant_id)) from
	(select session_id from or_sessions where session_start_year='2019') as a
    join (select participant_id, session_id from or_participate_at where registered='y') as b
    on a.session_id = b.session_id;

/* number of participants which registered at sessions in year X */
/* TODO: not correct -> fix it */
select count(distinct(participant_id)) from
	(select session_id from or_sessions where session_start_year='2017') as a
    join (select participant_id, session_id from or_participate_at where invited='y') as b
    on a.session_id = b.session_id;
    
/* number of finished sessions */
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
		and session_start_year in ('2017', '2018', '2019');

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
        
/* alle experimente die eine session in 2017 gaben */
select * from or_experiments as a where exists (select * from or_sessions as b where a.experiment_id = b.experiment_id and b.session_start_year = '2017'); 
/* alle teilnehmer, die in 2018 teilgenommen haben */
select participant_id from or_participate_at as a where exists (select * from or_sessions as b where a.session_id = b.session_id and b.session_start_year = '2018') and participated='y'; 

/* not follow ups */
select count(distinct(participant_id))
	from or_experiments as a 
    join or_participate_at as b
    on a.experiment_id = b.experiment_id
    where invited = 'y' and session_id = 0/* invited but not registered */
		and experiment_type = 'laboratory' 
		 /* alle experimente die eine session in 2018 haben */
		and exists (select * from or_sessions as c where a.experiment_id = c.experiment_id and c.session_start_year = '2019')
        /* participant_id hat in 2018 nicht teilgenommen */
        and b.participant_id not in (select participant_id from or_participate_at as d where exists (select * from or_sessions as e where d.session_id = e.session_id and e.session_start_year = '2019') and d.participated='y')
        /* participant hat irgendwann in 2017 teilgenommen */
        and b.participant_id in (select participant_id from or_participate_at as f where exists (select * from or_sessions as g where f.session_id = g.session_id and g.session_start_year = '2018') and f.participated='y');
  
/* all not registered invitations (including online) */
select count(*) from or_participate_at where session_id = 0 and invited = 'y';

/* experimente mit sessions in den jahren */
select count(distinct(a.experiment_id))
	from or_experiments as a
    join or_sessions as b
    on a.experiment_id = b.experiment_id
    where session_start_year in ('2017', '2018', '2019')
		and experiment_type = 'laboratory'
	group by session_start_year
    order by session_start_year asc;
    
 /* 20170101 since epoche 1483225200 */
 /* 20180101 since epoche 1514761200 */
 /* 20190101 since epoche 1546297200 */
 /* anzahl online experimente */
select count(experiment_id)
	from or_experiments
    where experiment_type =  'online-survey'
		and online_survey_start >= '1546297200'; 
		/* and online_survey_start < '';  */
        
/* online_survey started years before 20191106 */
select ('1573052436' - online_survey_start)/60/60/24/365
	from or_experiments
    where experiment_type = 'online-survey'
    order by online_survey_start asc;