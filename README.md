# census-rm-ddl
Contains ground zero scripts to create all the RM database tables, as well as a script to update the DDL from the master branch of the RM components

To run:
`build_groundzero_ddl.sh`

## Patching a database
The script `patch_database.py` is used by RM to run database patches from a tagged release of this repository. This script is invoked from our pipelines and will run in a Kubernetes pod to apply any database patches from files in the tagged release version of this repository.