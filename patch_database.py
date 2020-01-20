from datetime import datetime
from pathlib import Path

import psycopg2

from config import Config

conn = psycopg2.connect(f"dbname='{Config.DB_NAME}' user='{Config.DB_USERNAME}' host='{Config.DB_HOST}' "
                        f"password='{Config.DB_PASSWORD}' port='{Config.DB_PORT}'{Config.DB_USESSL}")
conn.set_session(autocommit=False)
cursor = conn.cursor()


def execute_sql_query(sql_query):
    cursor.execute(sql_query)
    return cursor.fetchall()


patches_directory = Path(__file__).parent.joinpath('patches')
sorted_patches = sorted([(patch_file, int(patch_file.name.split('_')[0])) for patch_file in patches_directory.iterdir()],
                        key=lambda i: i[1])
print([str(patch) for patch in sorted_patches])

current_patch = execute_sql_query('SELECT MAX(patch_version) FROM patch_version.patch_version;')[0][0] or 0

patches_to_apply = [patch_file_version for patch_file_version in sorted_patches if patch_file_version[1] > current_patch]

for patch_file_version in patches_to_apply:
    cursor.execute(patch_file_version[0].read_text())
    cursor.execute(f"INSERT INTO patch_version.patch_version (patch_version, applied_timestamp)"
                   f" VALUES ({patch_file_version[1]}, '{datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S')}Z')")
    conn.commit()
