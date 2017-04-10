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
source $SCRIPT_DIR/lib/03-swarm-deploy.sh
