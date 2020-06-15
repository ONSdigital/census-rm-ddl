
    create table action_plan (
       id uuid not null,
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table action_rule (
       id uuid not null,
        action_type varchar(255),
        classifiers jsonb not null,
        has_triggered boolean,
        trigger_date_time timestamp with time zone,
        action_plan_id uuid,
        primary key (id)
    );

    create table cases (
       case_ref int8 not null,
        abp_code varchar(255),
        action_plan_id varchar(255),
        address_invalid BOOLEAN DEFAULT false not null,
        address_level varchar(255),
        address_line1 varchar(255),
        address_line2 varchar(255),
        address_line3 varchar(255),
        address_type varchar(255),
        case_id uuid not null,
        case_type varchar(255),
        ce_actual_responses int4,
        ce_expected_capacity int4,
        collection_exercise_id varchar(255),
        estab_type varchar(255),
        estab_uprn varchar(255),
        field_coordinator_id varchar(255),
        field_officer_id varchar(255),
        hand_delivery BOOLEAN DEFAULT false,
        htc_digital varchar(255),
        htc_willingness varchar(255),
        lad varchar(255),
        latitude varchar(255),
        longitude varchar(255),
        lsoa varchar(255),
        metadata jsonb,
        msoa varchar(255),
        oa varchar(255),
        organisation_name varchar(255),
        postcode varchar(255),
        print_batch varchar(255),
        receipt_received BOOLEAN DEFAULT false not null,
        refusal_received varchar(255),
        region varchar(255),
        skeleton BOOLEAN DEFAULT false,
        survey_launched BOOLEAN DEFAULT false not null,
        town_name varchar(255),
        treatment_code varchar(255),
        uprn varchar(255),
        primary key (case_ref)
    );

    create table case_to_process (
       id  bigserial not null,
        batch_id uuid,
        batch_quantity int4 not null,
        ce_expected_capacity int4,
        action_rule_id uuid,
        caze_case_ref int8,
        primary key (id)
    );

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

    create table uac_qid_link (
       id uuid not null,
        active boolean,
        case_id varchar(255),
        qid varchar(255),
        uac varchar(255),
        primary key (id)
    );
create index receipt_received_idx on cases (receipt_received);
create index cases_case_id_idx on cases (case_id);
create index treatment_code_idx on cases (treatment_code);
create index lsoa_idx on cases (lsoa);
create index uacqid_case_id_idx on uac_qid_link (case_id);
create index qid_idx on uac_qid_link (qid);

    alter table if exists action_rule 
       add constraint FKh8d80cpj6kkb8rntu3iosln4e 
       foreign key (action_plan_id) 
       references action_plan;

    alter table if exists case_to_process 
       add constraint FKmqcrb58vhx7a7qcyyjjvm1y31 
       foreign key (action_rule_id) 
       references action_rule;

    alter table if exists case_to_process 
       add constraint FKfji3l4gnuwiha7gcdquu44fak 
       foreign key (caze_case_ref) 
       references cases;

    alter table if exists fulfilment_to_process 
       add constraint FKq3x3d2be44ac840lt6twonq8v 
       foreign key (caze_case_ref) 
       references cases;
