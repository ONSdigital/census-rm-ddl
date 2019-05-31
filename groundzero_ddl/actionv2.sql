
    create table ActionPlan (
       id uuid not null,
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table ActionRule (
       id uuid not null,
        actionType varchar(255),
        classifiers jsonb,
        hasTriggered boolean,
        triggerDateTime timestamp,
        actionPlan_id uuid,
        primary key (id)
    );

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

    create table UacQidLink (
       id uuid not null,
        caseId varchar(255),
        qid varchar(255),
        uac varchar(255),
        primary key (id)
    );
create index IDXhdh7ng2wcmfw7d5jl4mressjq on UacQidLink (caseId);

    alter table if exists ActionRule 
       add constraint FK6ww7b6enko5bj5l2jeki8iwxj 
       foreign key (actionPlan_id) 
       references ActionPlan;
