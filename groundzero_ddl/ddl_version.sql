CREATE schema ddl_version;

CREATE TABLE ddl_version.patches (patch_number integer PRIMARY KEY, applied_timestamp timestamp with time zone NOT NULL);
CREATE TABLE ddl_version.version (version_tag varchar(20) PRIMARY KEY, updated_timestamp timestamp with time zone NOT NULL);
