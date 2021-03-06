create schema if not exists exceptionmanager;
set schema 'exceptionmanager';
create table quarantined_message (
   id uuid not null,
    content_type varchar(255),
    error_reports jsonb,
    headers jsonb,
    message_hash varchar(255),
    message_payload bytea,
    queue varchar(255),
    routing_key varchar(255),
    service varchar(255),
    skipped_timestamp timestamp with time zone,
    primary key (id)
);

