#!/usr/bin/env bash

# ----------------------------------
# Arguments:
# ~
# $1 - machine name
# $2 - virtualbox-disk-size
# ----------------------------------
function recreate_machine() {

local machine_name=$1
local virtualbox_disk_size=${2:-10000}

echo
echo "${LCYAN}CREATING MACHINE \"$machine_name\" ${RESTORE}"

local RUNNING=$(docker inspect --format="{{.State.Running}}" $machine_name 2> /dev/null)
if [ $? -eq 2 ];
then
  echo "${SPACE}${GRAY}${S_BULLET} Machine \"$machine_name\" already exists!${RESTORE}"
  docker-machine stop $machine_name >/dev/null 2>&1 || true;
  docker-machine rm -y $machine_name >/dev/null 2>&1 || true;
  echo "${SPACE}${GREEN}${S_CHECK} Machine \"$machine_name\" successfully removed.${RESTORE}"
fi

echo "${SPACE}${GRAY}${S_BULLET} Creating \"$machine_name\" ...${RESTORE}"
docker-machine create -d virtualbox --virtualbox-disk-size=$virtualbox_disk_size $machine_name > /dev/null
echo "${SPACE}${GREEN}${S_CHECK} Machine \"$machine_name\" successfully created.${RESTORE}"

if [ "$(docker-machine status $machine_name)" != "Running" ];
then
  docker-machine start $machine_name
fi
echo "${SPACE}${GREEN}${S_CHECK} Machine \"$machine_name\" successfully started.${RESTORE}"

}

function create_managers() {
  if [ "$NUM_MANAGERS" -gt "0" ]; then
    for i in $(seq 1 $NUM_MANAGERS); do
      recreate_machine "$MACHINE_NAME_MANAGER_PREFIX$i"
    done
  fi
}

function create_workers() {
  if [ "$NUM_WORKERS" -gt "0" ]; then
    for i in $(seq 1 $NUM_WORKERS); do
      recreate_machine "$MACHINE_NAME_WORKER_PREFIX$i"
    done
  fi
}
