#!/bin/bash

psql -U $POSTGRES_USER -c "SELECT 1;" > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "Successfully connected to the Postgres"
  exit 0
else
  echo "Failed to connect to the Postgres"
  exit 1
fi
