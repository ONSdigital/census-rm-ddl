from datetime import datetime
from pathlib import Path

import psycopg2

from config import Config

PATCHES_DIRECTORY = Path(__file__).parent.joinpath('patches')


def get_current_patch_number(db_cursor):
    db_cursor.execute('SELECT MAX(patch_number) FROM ddl_version.patches')
    return db_cursor.fetchone()[0] or 0


def apply_patch(patch_file, patch_number, db_cursor, db_connection):
    try:
        db_cursor.execute(patch_file.read_text())
        db_cursor.execute("INSERT INTO ddl_version.patches (patch_number, applied_timestamp)"
                          " VALUES (%(patch_number)s, %(applied_timestamp)s)",
                          {'patch_number': patch_number,
                           'applied_timestamp': f'{datetime.utcnow().isoformat()}Z'})
    except Exception:
        db_connection.rollback()
        print(f"FAILED ON PATCH: {patch_file.name}")
        raise


def update_patch_version(patch_version, db_cursor):
    db_cursor.execute("INSERT INTO ddl_version.version (version_tag, updated_timestamp)"
                      " VALUES (%(version)s, %(updated_timestamp)s)",
                      {'version': patch_version,
                       'updated_timestamp': f'{datetime.utcnow().isoformat()}Z'})


def patch_database(patches_directory, patch_version, db_cursor, db_connection):
    patch_files = [{'file': patch_file, 'number': int(patch_file.name.split('_')[0])} for patch_file in
                   patches_directory.iterdir()]
    current_patch = get_current_patch_number(db_cursor)
    patches_to_apply = sorted([patch for patch in patch_files if patch['number'] > current_patch],
                              key=lambda patch: patch['number'])

    for patch in patches_to_apply:
        apply_patch(patch['file'], patch['number'], db_cursor, db_connection)
    if patches_to_apply:
        update_patch_version(patch_version, db_cursor)
        db_connection.commit()
        return
    print(f'NO PATCHES TO APPLY AT VERSION: {patch_version}')


def main():
    with psycopg2.connect(f"dbname='{Config.DB_NAME}' "
                          f"user='{Config.DB_USERNAME}' "
                          f"host='{Config.DB_HOST}' "
                          f"password='{Config.DB_PASSWORD}' "
                          f"port='{Config.DB_PORT}"
                          f"'{Config.DB_USESSL}") as db_connection:
        db_connection.set_session(autocommit=False)
        with db_connection.cursor() as db_cursor:
            patch_database(PATCHES_DIRECTORY, Config.PATCH_VERSION, db_cursor, db_connection)


if __name__ == '__main__':
    main()
