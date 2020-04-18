#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# point this to your mojaloop postman directory
POSTMAN_DIR=${DIR}/../../postman

cd ${POSTMAN_DIR}

newman run \
  --delay-request=2000 \
  --folder='p2p_money_transfer' \
  --environment=${DIR}/env_docker_compose_local.json \
  Golden_Path.postman_collection.json



