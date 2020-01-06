CREATE schema casev2;

CREATE TABLE casev2.cases (
    case_id uuid NOT NULL,
    case_ref integer,
    abp_code varchar(255),
    action_plan_id varchar(255),
    address_level varchar(255),
    address_line1 varchar(255),
    address_line2 varchar(255),
    address_line3 varchar(255),
    address_type varchar(255),
    arid varchar(255),
    ce_actual_responses integer,
    ce_expected_capacity integer,
    collection_exercise_id varchar(255),
    created_date_time timestamp with time zone,
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
    receipt_received boolean NOT NULL DEFAULT FALSE,
    region varchar(255),
    state varchar(255),
    town_name varchar(255),
    treatment_code varchar(255),
    uprn varchar(255),
    refusal_received boolean NOT NULL DEFAULT FALSE,
    case_type varchar(255),
    address_invalid boolean NOT NULL DEFAULT FALSE,
    undelivered_as_addressed boolean NOT NULL DEFAULT FALSE,
    ccs_case boolean NOT NULL DEFAULT FALSE,
    secret_sequence_number SERIAL NOT NULL,
    CONSTRAINT cases_pkey PRIMARY KEY (case_id)
);

CREATE TABLE casev2.uac_qid_link (
    id uuid NOT NULL,
    active boolean,
    batch_id uuid,
    qid varchar(255),
    uac varchar(255),
    caze_case_id UUID,
    ccs_case boolean NOT NULL DEFAULT FALSE,
    CONSTRAINT uac_qid_link_pkey PRIMARY KEY (id),
    FOREIGN KEY (caze_case_id) REFERENCES casev2.cases
);

CREATE TABLE casev2.event (
    id uuid NOT NULL,
    event_date timestamp with time zone,
    event_description varchar(255),
    event_type varchar(255),
    rm_event_processed timestamp with time zone,
    uac_qid_link_id uuid,
    case_id uuid,
    event_channel varchar(255),
    event_payload jsonb,
    event_source varchar(255),
    event_transaction_id uuid,
    caze_case_id UUID,
    CONSTRAINT event_pkey PRIMARY KEY (id),
    CONSTRAINT fk_uac_qid_link FOREIGN KEY (uac_qid_link_id) REFERENCES casev2.uac_qid_link (id),
    CONSTRAINT fk_case_ref FOREIGN KEY (caze_case_id) REFERENCES casev2.cases (case_id)
);

CREATE INDEX case_ref_idx ON casev2.cases (case_ref);

CREATE INDEX lsoa_idx ON casev2.cases (lsoa);

CREATE INDEX case_type_idx ON casev2.event (event_type);

CREATE INDEX event_processed_idx ON casev2.event (rm_event_processed);

CREATE INDEX qid_idx ON casev2.uac_qid_link (qid);