echo "Removing uprn index from database at $(date -u +"%FT%H-%M-%S")"
PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=${PASSWORD:=password} dbname=$DB_NAME"

psql "$PSQL_CONNECT_WRITE_MODE" -f data_patches/prod/main/300_remove_uprn_index_on_cases.sql
echo "Index has been removed at $(date -u +"%FT%H-%M-%S")"