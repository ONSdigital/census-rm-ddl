# census-rm-ddl[![Build Status](https://travis-ci.com/ONSdigital/census-rm-ddl.svg?branch=master)](https://travis-ci.com/ONSdigital/census-rm-ddl)
Contains ground zero scripts to create all the RM database tables, as well as a script to update the DDL from the master branch of the RM components

To run:
`build_groundzero_ddl.sh`

If you have made changes to Action Scheduler, Case Processor or the UAC-QID Service and you need to re-generate the ground zero DDL, you can specify specific branches with the following options:
- `CASE_PROCESSOR_BRANCH`
- `ACTION_SCHEDULER_BRANCH`
- `UAC_QID_SERVICE_BRANCH`

For example, you might want to run `CASE_PROCESSOR_BRANCH=example-branch build_groundzero_ddl.sh` to get the groundzero DDL to be generated for an as-yet unmerged branch called `example-branch`.

Once you have run the the `build_groundzero_ddl.sh` script, you will be able to see any differences between the old and the new DDL in Git, and create patch script(s) accordingly.

## Patching a database
The script `patch_database.py` is used by RM to run database patches from a tagged release of this repository. This script is invoked from our pipelines and will run in a Kubernetes pod to apply any database patches from files in the tagged release version of this repository.

## Releasing this repo
When tagging a release of this repo you must update the version and and patch number in [ddl_version.sql](groundzero_ddl/ddl_version.sql) and the [kubernetes yaml file](https://github.com/ONSdigital/census-rm-kubernetes/tree/master/optional/census-rm-ddl-pod.yml) for CI/WL
