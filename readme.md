# Moja DC

A Docker-compose based Mojaloop development environment. Useful for when you need the bare-bones Mojaloop for developing or testing.

By default, the `docker-compose.yml` file contains all of the services needed for a basic Mojaloop environment, including some simulators. If you want to write code for one or more of the services, refer to [using moja-dc in my environment](#using-moja-dc-in-my-environment) below.


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

> Note: this isn't completely working just yet. There's some callbacks that don't seem to be arriving at the right place

```bash
# clone the postman repo somewhere
cd ../ && git clone git@github.com:mojaloop/postman.git

# install newman
npm install -g newman

./scripts/_setup_hub.sh
```


## Example Transfer

```bash
./scripts/_test_transfer.sh
```


## Using moja-dc in my Environment

In order to get _your code_ running along this environment, you have a few options:
1. Build your own docker containers locally for any service you need, give them a name such at `mojaloop/quoting-service:local`, and update the docker-compose file to use this container
  > This is rather slow (even with docker layer caching) as you will need to rebuild your containers each time you make a code change.
2. Build your own containers like above, but _mount_ your code into them for _rapid_ develoment
  > Note: this can cause issues with node_modules, especially those which require native bindings, such as `node-rdkafka`.
3. Disable whatever service you want to write code for in `docker-compose.yml`. Run that service locally on your machine, and update your config to match - most often, this is a change such as changing a hostname from something like `quoting-service:3002` to `localhost:3002`.
  > This is the approach most mojaloop developers take at the time of writing, but requires extra work to ensure that your config files are set up appropriately so services outside of docker can talk to those inside, and vice-versa

