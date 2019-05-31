create sequence caseRefGenerator start 10000000 increment 50;

    create table cases (
       caseRef int8 not null,
        abpCode varchar(255),
        actionPlanId varchar(255),
        addressLevel varchar(255),
        addressLine1 varchar(255),
        addressLine2 varchar(255),
        addressLine3 varchar(255),
        addressType varchar(255),
        arid varchar(255),
        caseId uuid,
        ceExpectedCapacity varchar(255),
        collectionExerciseId varchar(255),
        estabArid varchar(255),
        estabType varchar(255),
        fieldCoordinatorId varchar(255),
        fieldOfficerId varchar(255),
        htcDigital varchar(255),
        htcWillingness varchar(255),
        lad varchar(255),
        latitude varchar(255),
        longitude varchar(255),
        lsoa varchar(255),
        msoa varchar(255),
        oa varchar(255),
        organisationName varchar(255),
        postcode varchar(255),
        region varchar(255),
        state varchar(255),
        townName varchar(255),
        treatmentCode varchar(255),
        uprn varchar(255),
        primary key (caseRef)
    );

    create table Event (
       id uuid not null,
        eventDate timestamp,
        eventDescription varchar(255),
        eventType varchar(255),
        rmEventProcessed timestamp,
        uacQidLink_id uuid,
        primary key (id)
    );

    create table UacQidLink (
       id uuid not null,
        qid varchar(255),
        uac varchar(255),
        uniqueNumber serial,
        caze_caseRef int8,
        primary key (id)
    );

    alter table if exists Event 
       add constraint FK2av61p6nmm2p4gg09nuyvkh49 
       foreign key (uacQidLink_id) 
       references UacQidLink;

    alter table if exists UacQidLink 
       add constraint FKk1xj1vq3npew623f49s9gue2g 
       foreign key (caze_caseRef) 
       references cases;
