CREATE schema ddl_version;

CREATE TABLE ddl_version.patches (patch_number integer PRIMARY KEY, applied_timestamp timestamp with time zone NOT NULL);
