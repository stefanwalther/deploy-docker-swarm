#!/usr/bin/env bash

docker-machine create --driver digitalocean --digitalocean-access-token $DO_TEST_TOKEN docker-sandbox
