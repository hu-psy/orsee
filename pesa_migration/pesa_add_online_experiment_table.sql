create table or_online_experiments(
    experiment_id int not null,
    link text not null,
    begin date not null,
    end date not null,
    primary key (experiment_id),
    constraint check_begin_end check(end >= begin));
