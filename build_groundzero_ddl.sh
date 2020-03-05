#!/bin/sh
rm groundzero_ddl/actionv2.sql
rm groundzero_ddl/casev2.sql
rm groundzero_ddl/uacqid.sql
rm -rf git_cloned_src
rm -rf temp_clone

mkdir temp_clone
cd temp_clone
git clone https://github.com/ONSdigital/census-rm-case-processor.git
git clone https://github.com/ONSdigital/census-rm-action-scheduler.git
git clone git@github.com:ONSdigital/census-rm-uac-qid-service.git
cd ..

mkdir -p git_cloned_src/uk/gov/ons/census/casesvc/model/entity
cp temp_clone/census-rm-case-processor/src/main/java/uk/gov/ons/census/casesvc/model/entity/* git_cloned_src/uk/gov/ons/census/casesvc/model/entity

mkdir -p git_cloned_src/uk/gov/ons/census/action/model/entity
mkdir -p git_cloned_src/uk/gov/ons/census/action/model/dto
cp temp_clone/census-rm-action-scheduler/src/main/java/uk/gov/ons/census/action/model/entity/* git_cloned_src/uk/gov/ons/census/action/model/entity
cp temp_clone/census-rm-action-scheduler/src/main/java/uk/gov/ons/census/action/model/dto/*.java git_cloned_src/uk/gov/ons/census/action/model/dto

mkdir -p git_cloned_src/uk/gov/ons/census/uacqid/model/entity
cp temp_clone/census-rm-uac-qid-service/src/main/java/uk/gov/ons/census/uacqid/model/entity/*.java git_cloned_src/uk/gov/ons/census/uacqid/model/entity

rm -rf temp_clone

mvn clean package

rm -rf git_cloned_src

java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar casev2 uk.gov.ons.census.casesvc.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar actionv2 uk.gov.ons.census.action.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar uacqid uk.gov.ons.census.uacqid.model.entity
