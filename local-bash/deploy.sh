#!/usr/bin/env bash

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh

swarm_deploy
play_with_it
