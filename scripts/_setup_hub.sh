#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# point this to your mojaloop postman directory
POSTMAN_DIR=${DIR}/../postman

cd ${POSTMAN_DIR}

newman run \
  --delay-request=2000 \
  --folder='Hub Account' \
  --environment=environments/Mojaloop-Local-Docker-Compose.postman_environment.json \
  OSS-New-Deployment-FSP-Setup.postman_collection.json