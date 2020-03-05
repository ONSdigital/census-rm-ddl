
    create table cases (
       case_id uuid not null,
        abp_code varchar(255),
        action_plan_id varchar(255),
        address_invalid BOOLEAN DEFAULT false not null,
        address_level varchar(255),
        address_line1 varchar(255),
        address_line2 varchar(255),
        address_line3 varchar(255),
        address_type varchar(255),
        arid varchar(255),
        case_ref int4,
        case_type varchar(255),
        ce_actual_responses int4,
        ce_expected_capacity int4,
        collection_exercise_id varchar(255),
        created_date_time timestamp with time zone,
        estab_arid varchar(255),
        estab_type varchar(255),
        field_coordinator_id varchar(255),
        field_officer_id varchar(255),
        hand_delivery BOOLEAN DEFAULT false,
        htc_digital varchar(255),
        htc_willingness varchar(255),
        lad varchar(255),
        last_updated timestamp with time zone,
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
        secret_sequence_number serial,
        survey varchar(255) not null,
        town_name varchar(255),
        treatment_code varchar(255),
        undelivered_as_addressed BOOLEAN DEFAULT false not null,
        uprn varchar(255),
        primary key (case_id)
    );

    create table event (
       id uuid not null,
        event_channel varchar(255),
        event_date timestamp with time zone,
        event_description varchar(255),
        event_payload jsonb,
        event_source varchar(255),
        event_transaction_id uuid,
        event_type varchar(255),
        message_timestamp Timestamp with time zone,
        rm_event_processed timestamp with time zone,
        caze_case_id uuid,
        uac_qid_link_id uuid,
        primary key (id)
    );

    create table uac_qid_link (
       id uuid not null,
        active boolean,
        batch_id uuid,
        ccs_case BOOLEAN DEFAULT false not null,
        qid varchar(255),
        uac varchar(255),
        caze_case_id uuid,
        primary key (id)
    );

    alter table if exists event 
       add constraint FKkrvohvnibf3k12ljhgiqrqicj 
       foreign key (caze_case_id) 
       references cases;

    alter table if exists event 
       add constraint FKamu77co5m9upj2b3c1oun21er 
       foreign key (uac_qid_link_id) 
       references uac_qid_link;

    alter table if exists uac_qid_link 
       add constraint FK6smi90asb0uj0q362xg7xf35p 
       foreign key (caze_case_id) 
       references cases;
