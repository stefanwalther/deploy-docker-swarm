#!/usr/bin/env bash

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh

# Summary
echo "${YELLOW}----------------------------------------------------${RESTORE}"
echo "${YELLOW}LOCAL DEPLOYMENT SCRIPT FOR A DOCKER SWARM${RESTORE}"
echo "${YELLOW}(using VirtualBox)${RESTORE}"
echo "${GRAY}~${RESTORE}"
echo "${GRAY}Summary:${RESTORE}"
echo "${GRAY}  ${S_BULLET} Managers to create: $NUM_MANAGERS${RESTORE}"
echo "${GRAY}  ${S_BULLET} Workers to create: $NUM_WORKERS${RESTORE}"
echo "${YELLOW}----------------------------------------------------${RESTORE}"
echo ""

# Create the machines
create_managers
create_workers
echo "==> Machines created";
