#!/usr/bin/env bash

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/lib/error-trap.sh
source $SCRIPT_DIR/lib/constants.sh
source $SCRIPT_DIR/config.sh
source $SCRIPT_DIR/lib/03-swarm-deploy.sh

swarm_deploy
