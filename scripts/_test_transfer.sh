#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# point this to your mojaloop postman directory
POSTMAN_DIR=${DIR}/../../postman

cd ${POSTMAN_DIR}


# This is not quite working, there is some issue with the ALS/Oracle/Simulator config that is broken here. 
# ths issue is likely in the `env_docker_compose_local.json` file, which sets up the config for the newman
# tests

# newman run \
#   --delay-request=2000 \
#   --folder='p2p_money_transfer' \
#   --environment=${DIR}/env_docker_compose_local.json \
#   Golden_Path.postman_collection.json

# newman run \
#   --delay-request=2000 \
#   --folder='Run-sample-quotes-transfers-to-prep-simulator' \
#   --environment=${DIR}/env_docker_compose_local.json \
#   Golden_Path.postman_collection.json

# newman run \
#   --delay-request=2000 \
#   --folder='p2p_happy_path SEND QUOTE' \
#   --environment=${DIR}/env_docker_compose_local.json \
#   Golden_Path.postman_collection.json

newman run \
  --delay-request=2000 \
  --folder='Get Party Receiver' \
  --environment=${DIR}/env_docker_compose_local.json \
  Golden_Path.postman_collection.json

# curl --location --request GET 'http://localhost:4002/parties/MSISDN/27713803912' \
# --header 'Accept: application/vnd.interoperability.parties+json;version=1' \
# --header 'Content-Type: application/vnd.interoperability.parties+json;version=1.0' \
# --header 'FSPIOP-Source: payerfsp' \
# --header 'Date: Thu, 24 Jan 2019 10:22:12 GMT'


# curl --location --request GET 'http://localhost:8444/payeefsp/requests/27713803912'
# --header 'Accept: application/vnd.interoperability.parties+json;version=1' \
# --header 'Content-Type: application/vnd.interoperability.parties+json;version=1.0' \
# --header 'FSPIOP-Source: payerfsp' \
# --header 'Date: Thu, 24 Jan 2019 10:22:12 GMT'




