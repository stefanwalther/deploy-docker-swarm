#!/usr/bin/env bash

# Get the managers and workers matching the pattern "manager-" and "worker-"

function init_managers() {

  _init_leader;
#  echo "JOIN_TOKEN_MANAGER: $JOIN_TOKEN_MANAGER"
#  echo "JOIN_TOKEN_WORKER: $JOIN_TOKEN_WORKER"

  _init_managers;

}

LEADER_IP=

function _init_leader() {

  local leader="$MACHINE_NAME_MANAGER$(expr 1)";

  eval "$(docker-machine env $leader)";

  LEADER_IP=$(docker-machine ip $leader);
  # Todo: What's about --listen-addr
  docker-machine ssh $leader docker swarm init --advertise-addr $LEADER_IP > /dev/null;

  echo "${SPACE}${GREEN}${S_CHECK} Machine \"$leader\" has been successfully elevated to be the leader.${RESTORE}";

  JOIN_TOKEN_MANAGER=$(docker-machine ssh $leader docker swarm join-token manager -q)
  JOIN_TOKEN_WORKER=$(docker-machine ssh $leader docker swarm join-token worker -q)

}

function _init_managers() {
  echo "Doing some stuff with the managers"
  for ((i=1; i<=$NUM_MANAGERS; i++)); do
    echo "Do magic stuff with mangers: $i";



  done
}

function init_workers() {

  for i in $(seq 1 $NUM_WORKERS); do
    _init_workers "$MACHINE_NAME_WORKER$i"
  done

}

function _init_workers() {
  local worker=${1};

  echo "${SPACE}${GRAY}${S_BULLET} Machine \"$worker\" to join the swarm as worker!${RESTORE}";

  local WORKER_IP=$(docker-machine ip $worker)
  eval "$(docker-machine env $worker)"

  docker-machine ssh $worker docker swarm join --token $JOIN_TOKEN_WORKER $LEADER_IP:2377 > /dev/null;
  echo "${SPACE}${GREEN}${S_CHECK} Machine \"$w\" successfully joined the swarm.${RESTORE}";

}
