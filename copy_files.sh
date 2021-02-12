#!/bin/bash

echo $APP
echo $params

cp apps/shin_${params.APP}/Dockerfile .

cp apps/shin_${params.APP}/deploy.sh .

ls -lha
