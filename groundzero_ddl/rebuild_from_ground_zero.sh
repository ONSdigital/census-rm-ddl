cd groundzero_ddl

PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=password dbname=$DB_NAME"
PSQL_ACTIONCONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql-action/root.crt sslcert=/root/.postgresql-action/postgresql.crt sslkey=/root/.postgresql-action/postgresql.key hostaddr=$ACTION_DB_HOST user=rmuser password=password dbname=$DB_NAME"

psql "$PSQL_CONNECT_WRITE_MODE" -f destroy_schemas.sql
psql "$PSQL_ACTIONCONNECT_WRITE_MODE" -f destroy_schemas.sql

for SCHEMA_NAME in casev2 uacqid exceptionmanager ddl_version
do
  echo "begin transaction;" > header_footer_temp.txt
  echo "create schema if not exists $SCHEMA_NAME;" >> header_footer_temp.txt
  echo "set schema '$SCHEMA_NAME';" >> header_footer_temp.txt
  cat $SCHEMA_NAME.sql >> header_footer_temp.txt
  echo "commit transaction;" >> header_footer_temp.txt
  cat header_footer_temp.txt > "copy_$SCHEMA_NAME.sql"

  psql "$PSQL_CONNECT_WRITE_MODE" -f copy_$SCHEMA_NAME.sql
  rm copy_$SCHEMA_NAME.sql
  rm header_footer_temp.txt
done


for SCHEMA_NAME in actionv2
do
  echo "begin transaction;" >> header_footer_temp.txt
  echo "create schema if not exists $SCHEMA_NAME;" >> header_footer_temp.txt
  echo "set schema '$SCHEMA_NAME';" >> header_footer_temp.txt
  cat $SCHEMA_NAME.sql >> header_footer_temp.txt
  echo "commit transaction;" >> header_footer_temp.txt
  cat header_footer_temp.txt > "copy_$SCHEMA_NAME.sql"

  psql "$PSQL_ACTIONCONNECT_WRITE_MODE" -f copy_$SCHEMA_NAME.sql
  rm copy_$SCHEMA_NAME.sql
  rm header_footer_temp.txt
done