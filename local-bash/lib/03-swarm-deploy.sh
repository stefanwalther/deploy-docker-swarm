#!/usr/bin/env bash


function swarm_deploy() {

  # Todo: Some output here ...
  # Todo: Make "manager-1" generic
  docker-machine scp ./../lib/docker-stack.yml manager-1:/home/docker/docker-stack.yml;
  docker-machine ssh manager-1 cd /home/docker;
  docker-machine ssh manager-1 docker stack deploy --compose-file docker-stack.yml vote

  # Todo: Some final summary here

}

function swarm_deploy_results() {

  echo

}

# Todo: Not used, yet; include in the output
function play_with_it() {

  # Todo: Make "manager-1" generic
  # Todo: Make it more generic in general to match "any" docker-stack.yml file (using labels)
  local manager_ip="$(docker-machine ip manager-1)";

  echo "Swarm visualizer: http://$manager_ip:8080"
  echo "Voting app: http://$manager_ip:5000"
  echo "Voting results: http://$manager_ip:5001"
  echo "Portainer : http://$manager_ip:9000"

}

