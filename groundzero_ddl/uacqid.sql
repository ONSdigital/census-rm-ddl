CREATE schema uacqid;

CREATE TABLE uacqid.uac_qid (
    uac varchar (255) NOT NULL,
    qid varchar (255),
    unique_number serial,
    CONSTRAINT uac_qid_pkey PRIMARY KEY (uac)
);

