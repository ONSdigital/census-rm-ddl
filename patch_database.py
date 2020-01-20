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
    return execute_sql_query('SELECT MAX(patch_version) FROM patch_version.patch_version;')[0][0] or 0


def patch_database():
    patch_files = [{'file': patch_file, 'patch_number': int(patch_file.name.split('_')[0])} for patch_file in patches_directory.iterdir()]
    current_patch = get_current_patch_number()
    patches_to_apply = sorted([patch for patch in patch_files if patch['patch_number'] > current_patch], key=lambda patch: patch['patch_number'])

    for patch in patches_to_apply:
        CURSOR.execute(patch['file'].read_text())
        CURSOR.execute(f"INSERT INTO patch_version.patch_version (patch_number, applied_timestamp)"
                       f" VALUES (%integer, %s)", (patch['patch_number'], f'{datetime.utcnow().isoformat()}Z'))
        CONN.commit()


if __name__ == '__main__':
    patch_database()
