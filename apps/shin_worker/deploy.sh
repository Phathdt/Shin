#!/bin/bash

docker rm -f shin-worker

docker run -d --name shin-worker \
  --network my-net \
  -e DATABASE_URL=postgres://phathdt379:password123@10.148.0.13:5432/shin \
  -e SENDGRID_API_KEY=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 \
  ${DOCKER_IMAGE}$APP:$TAG
