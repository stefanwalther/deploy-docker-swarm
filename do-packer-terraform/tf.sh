#!/usr/bin/env bash

export TF_LOG=TRACE;
export TF_TF_LOG_PATH=tf.log;

#terraform apply -target digitalocean_droplet.swarm-manager -target digitalocean_droplet.swarm-worker
terraform apply -target digitalocean_droplet.swarm-manager

