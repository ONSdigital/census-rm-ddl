
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
        trigger_date_time timestamp,
        action_plan_id uuid,
        primary key (id)
    );

    create table cases (
       case_ref int4 not null,
        abp_code varchar(255),
        action_plan_id varchar(255),
        address_invalid BOOLEAN DEFAULT false not null,
        address_level varchar(255),
        address_line1 varchar(255),
        address_line2 varchar(255),
        address_line3 varchar(255),
        address_type varchar(255),
        arid varchar(255),
        case_id uuid,
        case_type varchar(255),
        ce_actual_responses int4,
        ce_expected_capacity int4,
        collection_exercise_id varchar(255),
        estab_arid varchar(255),
        estab_type varchar(255),
        field_coordinator_id varchar(255),
        field_officer_id varchar(255),
        hand_delivery BOOLEAN DEFAULT false,
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
        receipt_received BOOLEAN DEFAULT false not null,
        refusal_received BOOLEAN DEFAULT false not null,
        region varchar(255),
        town_name varchar(255),
        treatment_code varchar(255),
        undelivered_as_addressed BOOLEAN DEFAULT false not null,
        uprn varchar(255),
        primary key (case_ref)
    );

    create table case_to_process (
       id  bigserial not null,
        batch_id uuid,
        batch_quantity int4 not null,
        action_rule_id uuid,
        caze_case_ref int4,
        primary key (id)
    );

    create table fulfilment_to_send (
       id  bigserial not null,
        batch_id uuid,
        fulfilment_code varchar(255),
        message_data jsonb not null,
        quantity int4,
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
create index treatment_code_idx on cases (treatment_code);

    alter table if exists cases 
       add constraint case_id_idx unique (case_id);
create index IDXrgnvkth2i8y3wlpclgv0vo2mc on uac_qid_link (case_id);

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
