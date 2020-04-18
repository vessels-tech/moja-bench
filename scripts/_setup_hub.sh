#!/usr/bin/env bash


curl --location --request POST 'http://localhost:3001/participants/Hub/accounts' \
--header 'Content-Type: application/json' \
--header 'FSPIOP-Source: payerfsp' \
--header 'Host: localhost:3001' \
--data-raw '{
  "type": "HUB_MULTILATERAL_SETTLEMENT",
  "currency": "USD"
}'