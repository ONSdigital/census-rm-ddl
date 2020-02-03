cd /groundzero_ddl/

PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=password dbname=$DB_NAME"
psql "$PSQL_CONNECT_WRITE_MODE" -f destroy_schemas.sql

for SCRIPT_NAME in actionv2.sql casev2.sql uacqid.sql ddl_version.sql
do
  echo "begin transaction;" > header_footer_temp.txt
  cat $SCRIPT_NAME >> header_footer_temp.txt
  echo "commit transaction;" >> header_footer_temp.txt
  cat header_footer_temp.txt > "copy_$SCRIPT_NAME"

  psql "$PSQL_CONNECT_WRITE_MODE" -f copy_$SCRIPT_NAME
  rm copy_$SCRIPT_NAME
  rm header_footer_temp.txt
done