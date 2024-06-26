#!/bin/bash

source slack.sh

DUMP_DIR="/dumps"
DUMP_NAME="$(date +'%Y%m%d%H%M%S').sql"

export PGPASSWORD=$POSTGRES_PASSWORD
pg_dump -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB > $DUMP_DIR/$DUMP_NAME

if [ $? -eq 0 ]; then
  echo "Dump completed successfully"
  cp -f $DUMP_DIR/$DUMP_NAME $DUMP_DIR/last.sql
  send_slack_notification "Dump completed successfully"
  exit 0
else
  echo "Failed in dump"
  send_slack_notification "Failed in dump"
  exit 1
fi
