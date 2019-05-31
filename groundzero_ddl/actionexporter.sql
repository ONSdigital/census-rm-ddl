create sequence actionexporter.actionrequestpkseq start 1 increment 1;
create sequence actionexporter.contactpkseq start 1 increment 1;

    create table actionexporter.actionrequest (
       actionrequestpk int4 not null,
        actionid uuid,
        actionplanname varchar(255),
        actiontypename varchar(255),
        casegroupstatus varchar(255),
        caseid uuid,
        caseref varchar(255),
        datestored timestamp,
        enrolmentstatus varchar(255),
        exerciseref varchar(255),
        exportjobid uuid,
        iac varchar(255),
        iac_wales varchar(255),
        legalbasis varchar(255),
        priority varchar(255),
        qid varchar(255),
        qid_wales varchar(255),
        questionset varchar(255),
        region varchar(255),
        respondentstatus varchar(255),
        responserequired boolean,
        returnbydate varchar(255),
        sampleunitref varchar(255),
        surveyref varchar(255),
        addressfk uuid,
        contactfk int4,
        primary key (actionrequestpk)
    );

    create table actionexporter.address (
       addresspk uuid not null,
        addresstype varchar(255),
        category varchar(255),
        country varchar(255),
        estabtype varchar(255),
        lad varchar(255),
        latitude numeric(19, 2),
        address_line1 varchar(255),
        address_line2 varchar(255),
        address_line3 varchar(255),
        locality varchar(255),
        longitude numeric(19, 2),
        organisation_name varchar(255),
        postcode varchar(255),
        town_name varchar(255),
        primary key (addresspk)
    );

    create table actionexporter.contact (
       contactpk int4 not null,
        emailaddress varchar(255),
        forename varchar(255),
        phonenumber varchar(255),
        surname varchar(255),
        title varchar(255),
        primary key (contactpk)
    );

    create table actionexporter.exportfile (
       id uuid not null,
        datesuccessfullysent timestamp,
        exportjobid uuid,
        filename varchar(255),
        status varchar(255),
        primary key (id)
    );

    create table actionexporter.exportjob (
       id uuid not null,
        primary key (id)
    );

    create table actionexporter.filerowcount (
       filename varchar(255) not null,
        datesent timestamp,
        reported boolean not null,
        rowcount int4 not null,
        sendresult boolean,
        primary key (filename)
    );

    create table actionexporter.template (
       templatenamepk varchar(255) not null,
        content varchar(255),
        datemodified timestamp,
        primary key (templatenamepk)
    );

    create table actionexporter.templatemapping (
       actiontypenamepk varchar(255) not null,
        datemodified timestamp,
        filenameprefix varchar(255),
        requesttype varchar(255),
        templatenamefk varchar(255),
        primary key (actiontypenamepk)
    );

    alter table if exists actionexporter.actionrequest 
       add constraint FKkp38rwvx4kqx83ev6axub9010 
       foreign key (addressfk) 
       references actionexporter.address;

    alter table if exists actionexporter.actionrequest 
       add constraint FKcm2uhgra4r3l5bhmqi0qbysmg 
       foreign key (contactfk) 
       references actionexporter.contact;
