#!/bin/sh

# get the db instance name for the connection
DB_INSTANCE_NAME=$(gcloud sql instances describe postgres --format="value(connectionName)")

gcloud run jobs deploy indexer \
  --source ~/empathy-labs/run-rag \
  --command python \
  --args app/indexer.py \
  --set-env-vars=DB_INSTANCE_NAME=$DB_INSTANCE_NAME \
  --set-env-vars=DB_USER=$DB_USER \
  --set-env-vars=DB_NAME=release-notes \
  --set-env-vars=DB_PASS=$DB_PASSWORD \
  --region=$REGION \
  --execute-now
