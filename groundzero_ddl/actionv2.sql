
    create table action_plan (
       id uuid not null,
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table action_rule (
       id uuid not null,
        action_type varchar(255),
        classifiers jsonb,
        has_triggered boolean,
        trigger_date_time timestamp,
        action_plan_id uuid,
        primary key (id)
    );

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
        region varchar(255),
        state varchar(255),
        town_name varchar(255),
        treatment_code varchar(255),
        uprn varchar(255),
        primary key (case_ref)
    );

    create table uac_qid_link (
       id uuid not null,
        case_id varchar(255),
        qid varchar(255),
        uac varchar(255),
        primary key (id)
    );
create index IDXrgnvkth2i8y3wlpclgv0vo2mc on uac_qid_link (case_id);

    alter table if exists action_rule 
       add constraint FKh8d80cpj6kkb8rntu3iosln4e 
       foreign key (action_plan_id) 
       references action_plan;
