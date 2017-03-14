#!/usr/bin/env bash

# Error trap definition
set -o errtrace
trap 'err_exit $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]})' ERR

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/lib/error-trap.sh
source $SCRIPT_DIR/lib/constants.sh
source $SCRIPT_DIR/config.sh
source $SCRIPT_DIR/lib/01-create-machines.sh
source $SCRIPT_DIR/lib/02-swarm-init.sh

# Summary
echo "${YELLOW}----------------------------------------------------${RESTORE}"
echo "${YELLOW}LOCAL DEPLOYMENT SCRIPT FOR A DOCKER SWARM${RESTORE}"
echo "${YELLOW}(using VirtualBox)${RESTORE}
echo "${GRAY}~${RESTORE}"
echo "${GRAY}Summary:${RESTORE}"
echo "${GRAY}  ${S_BULLET} Managers to create: $NUM_MANAGERS${RESTORE}"
echo "${GRAY}  ${S_BULLET} Workers to create: $NUM_WORKERS${RESTORE}"
echo "${YELLOW}----------------------------------------------------${RESTORE}"
echo ""

# Create the machines
create_managers
create_workers

# Initiate Docker swarm, both managers and workers
init_managers
init_workers
