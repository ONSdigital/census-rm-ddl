CREATE schema patch_version;

CREATE TABLE patch_version (patch_version integer PRIMARY KEY, applied_timestamp timestamp with time zone NOT NULL);
