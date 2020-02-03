CREATE schema actionv2;

CREATE TABLE actionv2.action_plan (
    id uuid NOT NULL,
    description varchar(255),
    name varchar(255),
    CONSTRAINT action_plan_pkey PRIMARY KEY (id)
);

CREATE TABLE actionv2.action_rule (
    id uuid NOT NULL,
    action_type varchar(255),
    classifiers jsonb,
    has_triggered boolean,
    trigger_date_time timestamp WITHOUT TIME ZONE,
    action_plan_id uuid,
    CONSTRAINT action_rule_pkey PRIMARY KEY (id),
    FOREIGN KEY (action_plan_id) REFERENCES actionv2.action_plan
);

CREATE TABLE actionv2.cases (
    case_ref integer NOT NULL,
    abp_code varchar(255),
    action_plan_id varchar(255),
    address_invalid boolean NOT NULL DEFAULT FALSE,
    address_level varchar(255),
    address_line1 varchar(255),
    address_line2 varchar(255),
    address_line3 varchar(255),
    address_type varchar(255),
    arid varchar(255),
    case_id uuid,
    case_type varchar(255),
    ce_actual_responses integer,
    ce_expected_capacity integer,
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
    receipt_received boolean NOT NULL DEFAULT FALSE,
    refusal_received boolean NOT NULL DEFAULT FALSE,
    region varchar(255),
    town_name varchar(255),
    treatment_code varchar(255),
    undelivered_as_addressed boolean NOT NULL DEFAULT FALSE,
    uprn varchar(255),
    CONSTRAINT cases_pkey PRIMARY KEY (case_ref),
    CONSTRAINT case_id UNIQUE (case_id)
);

CREATE TABLE actionv2.case_to_process (
    id bigserial NOT NULL,
    batch_id uuid,
    batch_quantity int NOT NULL,
    action_rule_id uuid,
    caze_case_ref int,
    CONSTRAINT case_to_process_pkey PRIMARY KEY (id),
    FOREIGN KEY (caze_case_ref) REFERENCES actionv2.cases(case_ref),
    FOREIGN KEY (action_rule_id) REFERENCES actionv2.action_rule(id)
);

CREATE TABLE actionv2.uac_qid_link (
    id uuid NOT NULL,
    active boolean,
    case_id varchar(255),
    qid varchar(255),
    uac varchar(255),
    CONSTRAINT uac_qid_link_pkey PRIMARY KEY (id)
);

CREATE TABLE actionv2.fulfilment_to_send (
    id bigserial NOT NULL,
    fulfilment_code varchar(255),
    message_data jsonb,
    quantity int,
    batch_id uuid,
    CONSTRAINT fulfilments_to_send_pkey PRIMARY KEY (id)
);


CREATE INDEX case_id_idx ON actionv2.cases (case_id);

CREATE INDEX lsoa_idx ON actionv2.cases (lsoa);

CREATE INDEX receipt_received_idx ON actionv2.cases (receipt_received);

CREATE INDEX treatment_code_idx ON actionv2.cases (treatment_code);

CREATE INDEX case_id_uac_qid_link_idx ON actionv2.uac_qid_link (case_id);

CREATE INDEX qid_idx ON actionv2.uac_qid_link (qid);



