create sequence case_ref_generator start 10000000 increment 50;

    create table cases (
       case_ref int8 not null,
        abp_code varchar(255),
        action_plan_id varchar(255),
        address_level varchar(255),
        address_line1 varchar(255),
        address_line2 varchar(255),
        address_line3 varchar(255),
        address_type varchar(255),
        arid varchar(255),
        case_id uuid,
        ce_expected_capacity varchar(255),
        collection_exercise_id varchar(255),
        estab_arid varchar(255),
        estab_type varchar(255),
        field_coordinator_id varchar(255),
        field_officer_id varchar(255),
        htc_digital varchar(255),
        htc_willingness varchar(255),
        lad varchar(255),
        latitude varchar(255),
        longitude varchar(255),
        lsoa varchar(255),
        msoa varchar(255),
        oa varchar(255),
        organisation_name varchar(255),
        postcode varchar(255),
        refusal_received boolean NOT NULL DEFAULT false,
        region varchar(255),
        state varchar(255),
        town_name varchar(255),
        treatment_code varchar(255),
        uprn varchar(255),
        primary key (case_ref)
    );

    create table event (
       id uuid not null,
        event_date timestamp,
        event_description varchar(255),
        event_type varchar(255),
        rm_event_processed timestamp,
        uac_qid_link_id uuid,
        primary key (id)
    );

    create table uac_qid_link (
       id uuid not null,
        qid varchar(255),
        uac varchar(255),
        unique_number serial,
        caze_case_ref int8,
        primary key (id)
    );

    alter table if exists event 
       add constraint FKamu77co5m9upj2b3c1oun21er 
       foreign key (uac_qid_link_id) 
       references uac_qid_link;

    alter table if exists uac_qid_link 
       add constraint FKgqdn6408vhuo465xp8tlibp7c 
       foreign key (caze_case_ref) 
       references cases;
