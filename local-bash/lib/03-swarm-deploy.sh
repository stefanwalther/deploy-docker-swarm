#!/usr/bin/env bash


function swarm_deploy() {

  # Todo: Some output here ...
  # Todo: Make "manager-1" generic
  docker-machine scp ./../lib/docker-stack.yml manager-1:/home/docker/docker-stack.yml;
  docker-machine ssh manager-1 cd /home/docker;
  docker-machine ssh manager-1 docker stack deploy --compose-file docker-stack.yml vote

  # Todo: Some final summary here

}

