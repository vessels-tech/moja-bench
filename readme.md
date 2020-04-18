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


# run the dfsp sims
docker-compose -f docker-compose-sims.yml up -d

```
