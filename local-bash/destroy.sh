#!/usr/bin/env bash

# Load the required scripts
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh

function destroy_managers() {
  for i in $(seq 1 $NUM_MANAGERS); do
    local machine_name="$MACHINE_NAME_MANAGER_PREFIX$i"
    echo "destroy $machine_name";
    docker-machine stop $machine_name >/dev/null 2>&1 || true;
    docker-machine rm -y $machine_name >/dev/null 2>&1 || true;
  done
}

function destroy_workers() {
  for i in $(seq 1 $NUM_WORKERS); do
    local machine_name="$MACHINE_NAME_WORKER_PREFIX$i"
    echo "destroy $machine_name";
    docker-machine stop $machine_name >/dev/null 2>&1 || true;
    docker-machine rm -y $machine_name >/dev/null 2>&1 || true;
  done
}

destroy_managers;
destroy_workers;
