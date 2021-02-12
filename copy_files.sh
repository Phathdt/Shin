#!/bin/bash

echo "apps/shin_${params.APP}/Dockerfile"

cp "apps/shin_${params.APP}/Dockerfile" .

cp "apps/shin_${params.APP}/deploy.sh" .
ls -lha
