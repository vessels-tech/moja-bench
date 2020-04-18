#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# point this to your mojaloop postman directory
POSTMAN_DIR=${DIR}/../../postman

cd ${POSTMAN_DIR}


# This is not quite working, there is some issue with the ALS/Oracle/Simulator config that is broken here. 
# ths issue is likely in the `env_docker_compose_local.json` file, which sets up the config for the newman
# tests

newman run \
  --delay-request=2000 \
  --folder='p2p_money_transfer' \
  --environment=${DIR}/env_docker_compose_local.json \
  Golden_Path.postman_collection.json



