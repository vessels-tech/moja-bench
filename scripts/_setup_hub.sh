#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# point this to your mojaloop postman directory
POSTMAN_DIR=${DIR}/../../postman

cd ${POSTMAN_DIR}

newman run \
  --delay-request=2000 \
  --folder='Hub Account' \
  --environment=${DIR}/env_docker_compose_local.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json

newman run \
  --delay-request=2000 \
  --folder='payerfsp (p2p transfers)' \
  --environment=${DIR}/env_docker_compose_local.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json

newman run \
  --delay-request=2000 \
  --folder='payeefsp (p2p transfers)' \
  --environment=${DIR}/env_docker_compose_local.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json

newman run \
  --delay-request=2000 \
  --folder='payeefsp' \
  --environment=${DIR}/env_docker_compose_local.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json

# Hmm, looks like user 27720201001 is never registered...

newman run \
  --delay-request=2000 \
  --folder='Oracle Onboarding' \
  --environment=${DIR}/env_docker_compose_local.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json

newman run \
  --delay-request=2000 \
  --folder='Add Users to ALS / mock-pathfinder' \
  --environment=${DIR}/env_docker_compose_local.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json



