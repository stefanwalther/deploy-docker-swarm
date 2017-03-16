#!/usr/bin/env bash

# Options here: https://docs.docker.com/machine/drivers/digital-ocean/
docker-machine create --driver digitalocean \
  --digitalocean-access-token $DO_TOKEN \
  --digitalocean-image "docker-16-04" \
  --digitalocean-region "fra1" \
  --digitalocean-size "1gb" \
  --digitalocean-private-networking \
   docker-sandbox
