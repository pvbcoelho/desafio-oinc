set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE desafio_oinc_dev;
    GRANT ALL PRIVILEGES ON DATABASE desafio_oinc_dev TO postgres;
    CREATE DATABASE desafio_oinc_event_store_dev;
    GRANT ALL PRIVILEGES ON DATABASE desafio_oinc_event_store_dev TO postgres;
EOSQL