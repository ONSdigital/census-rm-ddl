cd groundzero_ddl

PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=${PASSWORD:=password} dbname=$DB_NAME"
PSQL_ACTIONCONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql-action/root.crt sslcert=/root/.postgresql-action/postgresql.crt sslkey=/root/.postgresql-action/postgresql.key hostaddr=$DB_HOST_ACTION user=rmuser password=${PASSWORD:=password} dbname=$DB_NAME"

psql "$PSQL_CONNECT_WRITE_MODE" -f destroy_schemas.sql
psql "$PSQL_ACTIONCONNECT_WRITE_MODE" -f ACTION-destroy_schemas.sql

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

echo "begin transaction;" >> header_footer_temp.txt
echo "create schema if not exists actionv2;" >> header_footer_temp.txt
echo "set schema 'actionv2';" >> header_footer_temp.txt
cat actionv2.sql >> header_footer_temp.txt
echo "commit transaction;" >> header_footer_temp.txt
cat header_footer_temp.txt > "copy_actionv2.sql"

psql "$PSQL_ACTIONCONNECT_WRITE_MODE" -f copy_actionv2.sql
rm copy_actionv2.sql
rm header_footer_temp.txt

echo "begin transaction;" >> header_footer_temp.txt
echo "create schema if not exists ddl_version;" >> header_footer_temp.txt
echo "set schema 'ddl_version';" >> header_footer_temp.txt
cat ACTION-ddl_version.sql >> header_footer_temp.txt
echo "commit transaction;" >> header_footer_temp.txt
cat header_footer_temp.txt > "copy_ACTION-ddl_version.sql"

psql "$PSQL_ACTIONCONNECT_WRITE_MODE" -f copy_ACTION-ddl_version.sql
rm copy_ACTION-ddl_version.sql
rm header_footer_temp.txt
