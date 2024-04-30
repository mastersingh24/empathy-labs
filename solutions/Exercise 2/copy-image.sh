#!/bin/sh
docker pull quay.io/jitesoft/nginx
docker tag quay.io/jitesoft/nginx:latest $REGION-docker.pkg.dev/$PROJECT_ID/empathy/nginx
docker push $REGION-docker.pkg.dev/$PROJECT_ID/empathy/nginx