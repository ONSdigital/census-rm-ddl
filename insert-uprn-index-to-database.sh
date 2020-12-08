echo "Inserting uprn index to database at $(date -u +"%FT%H-%M-%S")"
PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=${PASSWORD:=password} dbname=$DB_NAME"

psql "$PSQL_CONNECT_WRITE_MODE" -f data_patches/prod/main/200_create_uprn_index_for_cases.sql
echo "Finished inserting uprn index into database at $(date -u +"%FT%H-%M-%S")"
