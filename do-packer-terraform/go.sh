#!/usr/bin/env bash

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`

source $SCRIPT_DIR/lib/00-config.sh
source $SCRIPT_DIR/lib/01-ssh-key.sh
source $SCRIPT_DIR/lib/02-packer.sh

# Generate the keys
gen_key


# Create the snapshot on DO
pack



export TF_VAR_swarm_snapshot_id=$(grep 'artifact,0,id' packer-ubuntu-docker.log | cut -d, -f6 | cut -d: -f2);
#echo "Snapshot Id: $TF_VAR_swarm_snapshot_id";



#terraform plan \
#  -target digitalocean_droplet.swarm-manager \
#  -target digitalocean_droplet.swarm-worker
#
#terraform plan \
#  -target digitalocean_droplet.swarm-manager \
#  -target digitalocean_droplet.swarm-worker \
#  -var swarm_init=true \
#  -var swarm_manager=1;

# Todo: Test, why we have to create first one, instead of creating them altogether
terraform apply \
          -target digitalocean_droplet.swarm-manager \
          -var swarm_init=true \
          -var swarm_managers=1;

terraform refresh;

exit 1;


# Todo: Does not really help, but forces a user-input which cannot be suppressed
#ssh -i do-packer-terraform root@$(terraform output swarm_manager_1_public_ip) docker node ls;

export TF_VAR_swarm_manager_token=$(ssh \
  -i do-packer-terraform \
  root@$(terraform output swarm_manager_1_public_ip) \
  -o "StrictHostKeyChecking no" \
  docker swarm join-token -q manager);

export TF_VAR_swarm_worker_token=$(ssh \
  -i do-packer-terraform \
  root@$(terraform output swarm_manager_1_public_ip) \
  -o "StrictHostKeyChecking no" \
  docker swarm join-token -q worker);

export TF_VAR_swarm_manager_ip=$(terraform output swarm_manager_1_private_ip);

# Todo: Just for information, can be removed
#terraform plan \
#  -target digitalocean_droplet.swarm-manager \
#  -target digitalocean_droplet.swarm-worker;

terraform apply \
  -target digitalocean_droplet.swarm-manager \
  -target digitalocean_droplet.swarm-worker;





