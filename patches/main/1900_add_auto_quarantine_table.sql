set schema 'exceptionmanager';

create table auto_quarantine_rule (
   id uuid not null,
    expression varchar(255),
    primary key (id)
);
