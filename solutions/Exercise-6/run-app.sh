#!/bin/sh

# get the db instance name for the connection
DB_INSTANCE_NAME=$(gcloud sql instances describe postgres --format="value(connectionName)")

gcloud run deploy run-rag \
  --source ~/empathy-labs/run-rag \
  --set-env-vars=DB_INSTANCE_NAME=$DB_INSTANCE_NAME \
  --set-env-vars=DB_USER=$DB_USER \
  --set-env-vars=DB_NAME=release-notes \
  --set-env-vars=DB_PASS=$DB_PASSWORD \
  --region=$REGION \
  --allow-unauthenticated
