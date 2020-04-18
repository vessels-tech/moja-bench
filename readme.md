# Moja Bench

Scratch repo for playing aroud with simple mojaloop benchmarks from docker-compose.

We might recycle some of this config for a PISP test environment or something.


## Running everything

```bash
# run everything together
docker-compose up -d


# check it's running 
# note: some of the health checks are reporting unhealthy or stuck on 'starting', when in fact they are ok
docker-compose ps


# see the services for yourself
curl localhost:3000/health # ml-api-adapter
curl localhost:3001/health # central-ledger
curl localhost:3002/health # quoting-service
curl localhost:4001/health # account-lookup-service

```

## Setup the simulators etc.

- register endpoints?
- 


## Example Transfer

todo

```bash
CONTAINER_NAME=$(docker ps -f ancestor=mojaloop-simulator-backend --format '{{.Names}}')
SIMULATOR_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$CONTAINER_NAME")

localhost:3403/scenarios
curl -X POST \
  "http://localhost:3403/scenarios" \
  -H 'Content-Type: application/json' \
  -d '[
    {
        "name": "scenario1",
        "operation": "postTransfers",
        "body": {
            "from": {
                "displayName": "James Bush",
                "idType": "MSISDN",
                "idValue": "44123456789"
            },
            "to": {
                "idType": "MSISDN",
                "idValue": "44987654321"
            },
            "amountType": "SEND",
            "currency": "USD",
            "amount": "100",
            "transactionType": "TRANSFER",
            "note": "test payment",
            "homeTransactionId": "123ABC"
        }
    },
    {
        "name": "scenario2",
        "operation": "putTransfers",
        "params": {
            "transferId": "{{scenario1.result.transferId}}"
        },
        "body": {
            "acceptQuote": true
        }
    }
]'
```