import os


class Config:
    DB_USERNAME = os.getenv('DB_USERNAME', 'postgres')
    DB_PASSWORD = os.getenv('DB_PASSWORD', 'postgres')
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_PORT = os.getenv('DB_PORT', '6432')
    DB_NAME = os.getenv('DB_NAME', 'postgres')
    DB_USESSL = os.getenv('DB_USESSL', '')
    DB_HOST_ACTION = os.getenv('DB_HOST_ACTION', 'localhost')
    DB_ACTION_CERTIFICATES = (" sslmode=verify-ca sslrootcert=/root/.postgresql-action/root.crt "
                              "sslcert=/root/.postgresql-action/postgresql.crt "
                              "sslkey=/root/.postgresql-action/postgresql.key")
