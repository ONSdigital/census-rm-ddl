if [ -z $PATCH_VERSION ]; then
  echo "patch_database_to_version requires environment variable PATCH_VERSION"
  exit 1
fi

python patch_database.py $PATCH_VERSION
