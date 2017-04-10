#!/usr/bin/env bash

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
echo "${GRAY}  ${S_BULLET} Create a swarm with $NUM_MANAGERS managers & $NUM_WORKERS workers${RESTORE}"
echo "${YELLOW}----------------------------------------------------${RESTORE}"

# Initiate Docker swarm, both managers and workers
init_managers
echo ""
echo "==> Managers initialized";

init_workers
echo ""
echo "==> Workers initialized";
