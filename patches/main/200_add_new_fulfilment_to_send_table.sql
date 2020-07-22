-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 200                                                          ***
-- *** Purpose: Add new "fulfilment_to_send" table to the actionv2 schema   ***
-- *** Author: Ryan Grundy                                                  ***
-- ****************************************************************************

CREATE TABLE actionv2.fulfilment_to_send (
    id bigserial NOT NULL,
    fulfilment_code varchar(255),
    message_data jsonb,
    quantity int,
    batch_id uuid,
    CONSTRAINT fulfilments_to_send_pkey PRIMARY KEY (id)
);