# Play with the docker stack

For all the commands below you have to be logged into one of the nodes.

In case of using one of the Vagrant examples use:

```sh
$ vagrant ssh <machine-name>

# e.g.
# vagrant ssh manager-1
```

For the pure bash examples just use:

```sh
$ docker-machine ssh <machine-name>

# e.g.
# docker-machine ssh manager-1
```

## Inspect

List the nodes:
```sh
$ docker node ls
```

List tasks running on one or more nodes, defaults to current node
```sh
$ docker node ps
$ docker node ps manager-1
$ docker node ps worker-1
```

### Inspect the stack

List the services populated:
```sh
$ docker service ls
```


### Inspect the services

Get more information about a particular service
```sh
$ docker service ps <service_name>

# eg the service vote_vote
# docker service ps vote_vote
```

## Modify

### Scale a service

Scale a service:
```sh
$ docker service scale <service_name>=<num_instances>

# eg scale service vote_vote to 3 instances
# $ docker service scale vote_vote=3
```

### Update a stack

Deploy or update a stack:
```sh
$ docker stack deploy --compose-file /vagrant/docker-stack.yml vote
```

Remove the stack:
```sh
$ docker stack rm vote
```

