#!/bin/bash

docker rm -f shin-client

docker run -d --name shin-client \
  --network my-net \
  -e DATABASE_URL=postgres://phathdt379:password123@10.148.0.13:5432/shin \
  -e SECRET_KEY_BASE=43HToczwEtbLIujVyC/L7syuUDAEHklOVydWoxt6Tu33IfUGT8ZaQbpVTcH5jnw8 \
  -e REDIS_URL=redis://10.148.0.13:6379 \
  -e PORT=6000 \
  -p 6000:6000 \
  ${DOCKER_IMAGE}$APP:$TAG
