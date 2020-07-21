import os

ACTION_CERTS = (" sslmode=verify-ca sslrootcert=/home/toolbox/.postgresql-action/root.crt "
                "sslcert=/home/toolbox/.postgresql-action/postgresql.crt "
                "sslkey=/home/toolbox/.postgresql-action/postgresql.key")


class Config:
    DB_USERNAME = os.getenv('DB_USERNAME', 'postgres')
    DB_PASSWORD = os.getenv('DB_PASSWORD', 'postgres')
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_PORT = os.getenv('DB_PORT', '6432')
    DB_NAME = os.getenv('DB_NAME', 'postgres')
    DB_USESSL = os.getenv('DB_USESSL', '')
    DB_HOST_ACTION = os.getenv('DB_HOST_ACTION', 'localhost')
    DB_ACTION_CERTIFICATES = os.getenv('DB_ACTION_CERTIFICATES', ACTION_CERTS)
