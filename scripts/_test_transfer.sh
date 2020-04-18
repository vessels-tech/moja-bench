#!/usr/bin/env bash

# register the user
# curl --location --request POST 'http://localhost:8444/payeefsp/parties/MSISDN/27713803912' \
# --header 'Content-Type: application/json' \
# --data-raw '{
#     "party": {
#         "partyIdInfo": {
#             "partyIdType": "MSISDN",
#             "partyIdentifier": "27713803912",
#             "fspId": "payeefsp"
#         },
#         "name": "Siabelo Maroka",
#         "personalInfo": {
#             "complexName": {
#                 "firstName": "Siabelo",
#                 "lastName": "Maroka"
#             },
#             "dateOfBirth": "3/3/1973"
#         }
#     }
# }'

## register with ALS

curl --location --request POST 'http://localhost:4002/participants/MSISDN/27713803912' \
--header 'Accept: application/vnd.interoperability.participants+json;version=1' \
--header 'Connection: keep-alive' \
--header 'Content-Type: application/vnd.interoperability.participants+json;version=1.0' \
--header 'Date: Fri, 21 Dec 2018 12:17:01 GMT' \
--header 'FSPIOP-Source: payeefsp' \
--header 'accept-encoding: gzip, deflate' \
--header 'cache-control: no-cache' \
--data-raw '{
    "fspId": "payeefsp",
    "currency": "USD"
}'

# do a lookup?
# curl --location --request GET 'http://localhost:4002/parties/MSISDN/11112222' \
# --header 'Accept: application/vnd.interoperability.parties+json' \
# --header 'Content-Type: application/vnd.interoperability.parties+json' \
# --header 'FSPIOP-Source: payerfsp' \
# --header 'Date: Thu, 24 Jan 2019 10:22:12 GMT'