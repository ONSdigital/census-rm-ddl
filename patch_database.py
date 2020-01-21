from datetime import datetime
from pathlib import Path

import psycopg2

from config import Config

CONN = psycopg2.connect(f"dbname='{Config.DB_NAME}' user='{Config.DB_USERNAME}' host='{Config.DB_HOST}' "
                        f"password='{Config.DB_PASSWORD}' port='{Config.DB_PORT}'{Config.DB_USESSL}")
CONN.set_session(autocommit=False)
CURSOR = CONN.cursor()

patches_directory = Path(__file__).parent.joinpath('patches')


def execute_sql_query(sql_query):
    CURSOR.execute(sql_query)
    return CURSOR.fetchall()


def get_current_patch_number():
    return execute_sql_query('SELECT MAX(patch_number) FROM ddl_version.patches')[0][0] or 0


def patch_database():
    patch_files = [{'file': patch_file, 'patch_number': int(patch_file.name.split('_')[0])} for patch_file in
                   patches_directory.iterdir()]
    current_patch = get_current_patch_number()
    patches_to_apply = sorted([patch for patch in patch_files if patch['patch_number'] > current_patch],
                              key=lambda patch: patch['patch_number'])

    for patch in patches_to_apply:
        try:
            CURSOR.execute(patch['file'].read_text())
            CURSOR.execute("INSERT INTO ddl_version.patches (patch_number, applied_timestamp)"
                           " VALUES (%(patch_number)s, %(applied_timestamp)s)",
                           {'patch_number': patch['patch_number'],
                            'applied_timestamp': f'{datetime.utcnow().isoformat()}Z'})
        except Exception:
            CONN.rollback()
            print(f"FAILURE ON PATCH: {patch['file'].name}")
            raise
    CONN.commit()


if __name__ == '__main__':
    patch_database()
