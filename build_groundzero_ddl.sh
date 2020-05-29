#!/bin/bash
rm groundzero_ddl/actionv2.sql
rm groundzero_ddl/casev2.sql
rm groundzero_ddl/uacqid.sql
rm groundzero_ddl/exceptionmanager.sql
rm -rf git_cloned_src
rm -rf temp_clone

mkdir temp_clone
cd temp_clone

if [ -z "$CASE_PROCESSOR_BRANCH" ]; then
  git clone https://github.com/ONSdigital/census-rm-case-processor.git
else
  echo "Cloning Case Processor branch $CASE_PROCESSOR_BRANCH"
  git clone --branch $CASE_PROCESSOR_BRANCH https://github.com/ONSdigital/census-rm-case-processor.git
fi

if [ -z "$ACTION_SCHEDULER_BRANCH" ]; then
  git clone https://github.com/ONSdigital/census-rm-action-scheduler.git
else
  echo "Cloning Action Scheduler branch $ACTION_SCHEDULER_BRANCH"
  git clone --branch $ACTION_SCHEDULER_BRANCH https://github.com/ONSdigital/census-rm-action-scheduler.git
fi

if [ -z "$UAC_QID_SERVICE_BRANCH" ]; then
  git clone git@github.com:ONSdigital/census-rm-uac-qid-service.git
else
  echo "Cloning UAC QID Service branch $UAC_QID_SERVICE_BRANCH"
  git clone --branch $UAC_QID_SERVICE_BRANCH git@github.com:ONSdigital/census-rm-uac-qid-service.git
fi

if [ -z "$EXCEPTION_MANAGER_BRANCH" ]; then
  git clone git@github.com:ONSdigital/census-rm-exception-manager.git
else
  echo "Cloning Exception Manager branch $EXCEPTION_MANAGER_BRANCH"
  git clone --branch $EXCEPTION_MANAGER_BRANCH git@github.com:ONSdigital/census-rm-exception-manager.git
fi

cd ..

mkdir -p git_cloned_src/uk/gov/ons/census/casesvc/model/entity
cp temp_clone/census-rm-case-processor/src/main/java/uk/gov/ons/census/casesvc/model/entity/* git_cloned_src/uk/gov/ons/census/casesvc/model/entity

mkdir -p git_cloned_src/uk/gov/ons/census/action/model/entity
mkdir -p git_cloned_src/uk/gov/ons/census/action/model/dto
cp temp_clone/census-rm-action-scheduler/src/main/java/uk/gov/ons/census/action/model/entity/* git_cloned_src/uk/gov/ons/census/action/model/entity
cp temp_clone/census-rm-action-scheduler/src/main/java/uk/gov/ons/census/action/model/dto/*.java git_cloned_src/uk/gov/ons/census/action/model/dto

mkdir -p git_cloned_src/uk/gov/ons/census/uacqid/model/entity
cp temp_clone/census-rm-uac-qid-service/src/main/java/uk/gov/ons/census/uacqid/model/entity/*.java git_cloned_src/uk/gov/ons/census/uacqid/model/entity

mkdir -p git_cloned_src/uk/gov/ons/census/exceptionmanager/model/entity
cp temp_clone/census-rm-exception-manager/src/main/java/uk/gov/ons/census/exceptionmanager/model/entity/*.java git_cloned_src/uk/gov/ons/census/exceptionmanager/model/entity

rm -rf temp_clone

mvn clean package

rm -rf git_cloned_src

java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar casev2 uk.gov.ons.census.casesvc.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar actionv2 uk.gov.ons.census.action.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar uacqid uk.gov.ons.census.uacqid.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar exceptionmanager uk.gov.ons.census.exceptionmanager.model.entity
