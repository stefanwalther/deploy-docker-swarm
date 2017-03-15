#!/usr/bin/env bash

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/lib/parse-yaml.sh

eval $(parse_yaml config.yml "CONFIG_")

echo $CONFIG_DO_SIZE;
