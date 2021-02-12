#!/bin/bash

APP=$1

echo $APP

echo "apps/shin_${APP}/Dockerfile"

cp "apps/shin_${APP}/Dockerfile" .

cp "apps/shin_${APP}/deploy.sh" .

ls -lha
