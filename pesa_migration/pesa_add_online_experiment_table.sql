create table or_online_experiments(
    experiment_id int not null,
    link text not null,
    begin datetime not null,
    end datetime not null,
    primary key (experiment_id),
    constraint check_begin_end check(end >= begin));
