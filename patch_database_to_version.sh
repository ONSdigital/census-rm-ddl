if [ -z $PATCH_VERSION ]; then
  echo "patch_database_to_version requires environment variable PATCH_VERSION"
  exit 1
fi

rm -rf tmp_patch_database
mkdir tmp_patch_database
pushd tmp_patch_database


git clone --branch $PATCH_VERSION https://github.com/ONSdigital/census-rm-ddl

python patch_database.py