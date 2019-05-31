#!/bin/sh
rm -rf groundzero_ddl
rm -rf git_cloned_src

mkdir temp_clone
cd temp_clone
git clone https://github.com/ONSdigital/census-rm-case-processor.git
git clone https://github.com/ONSdigital/census-rm-action-scheduler.git
git clone https://github.com/ONSdigital/census-rm-actionexporter-service.git
cd ..

mkdir -p git_cloned_src/uk/gov/ons/census/casesvc/model/entity
cp temp_clone/census-rm-case-processor/src/main/java/uk/gov/ons/census/casesvc/model/entity/* git_cloned_src/uk/gov/ons/census/casesvc/model/entity

mkdir -p git_cloned_src/uk/gov/ons/census/action/model/entity
cp temp_clone/census-rm-action-scheduler/src/main/java/uk/gov/ons/census/action/model/entity/* git_cloned_src/uk/gov/ons/census/action/model/entity

mkdir -p git_cloned_src/uk/gov/ons/ctp/response/action/export/domain
cp temp_clone/census-rm-actionexporter-service/src/main/java/uk/gov/ons/ctp/response/action/export/domain/* git_cloned_src/uk/gov/ons/ctp/response/action/export/domain

rm -rf temp_clone

mvn clean package

rm -rf git_cloned_src

java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar casev2 uk.gov.ons.census.casesvc.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar actionv2 uk.gov.ons.census.action.model.entity
java -jar target/census-rm-ddl-1.0-SNAPSHOT.jar actionexporter uk.gov.ons.ctp.response.action.export.domain
