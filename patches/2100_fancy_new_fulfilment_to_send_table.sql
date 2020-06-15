DROP TABLE IF EXISTS actionv2.fulfilment_to_send;

set schema 'actionv2';

create table fulfilment_to_process (
   id  bigserial not null,
    action_type varchar(255),
    address_line1 varchar(255),
    address_line2 varchar(255),
    address_line3 varchar(255),
    batch_id uuid,
    field_coordinator_id varchar(255),
    field_officer_id varchar(255),
    forename varchar(255),
    fulfilment_code varchar(255),
    organisation_name varchar(255),
    postcode varchar(255),
    quantity int4,
    surname varchar(255),
    title varchar(255),
    town_name varchar(255),
    caze_case_ref int8,
    primary key (id)
);

alter table if exists fulfilment_to_process
   add constraint FKq3x3d2be44ac840lt6twonq8v
   foreign key (caze_case_ref)
   references cases;
