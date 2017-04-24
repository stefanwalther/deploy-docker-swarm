# Play with the docker stack

Based on the all the different deployment variants, here are some scripts to start getting familiar with docker-swarm. 
Just experiment, if something goes wrong, just re-deploy, that's the point ;-)

## Info about the machines

**List all machines:**
```sh
$ docker-machine ls
```

Result:
```sh
NAME        ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
manager-1   -        virtualbox   Running   tcp://192.168.99.100:2376           v17.03.0-ce   
manager-2   -        virtualbox   Running   tcp://192.168.99.101:2376           v17.03.0-ce   
worker-1    -        virtualbox   Running   tcp://192.168.99.102:2376           v17.03.0-ce   
worker-2    -        virtualbox   Running   tcp://192.168.99.103:2376           v17.03.0-ce   
worker-3    -        virtualbox   Running   tcp://192.168.99.104:2376           v17.03.0-ce   
```

## Login into one of the machines

For all the commands below you have to be logged in into one of the nodes.

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

**List the nodes:**
```sh
$ docker node ls
```

Result:
```sh
ID                           HOSTNAME   STATUS  AVAILABILITY  MANAGER STATUS
f38odq9he9hf9rj8vnl45l606    worker-1   Ready   Active        
q8jfuboe91ls3x1r281kqbd1o *  manager-1  Ready   Active        Leader
qju9yyoc7ijv418mnzfyxutqn    manager-2  Ready   Active        Reachable
rdcnouwgcw7nmetpbtyo8iyzb    worker-2   Ready   Active        
sm5pzbkt10gxgz8bs8zzht2c0    worker-3   Ready   Active        
```


**List tasks running** on one or more nodes, defaults to current node
```sh
$ docker node ps [<node-id>]
```

Result:
```sh
ID            NAME               IMAGE                                         NODE       DESIRED STATE  CURRENT STATE          ERROR  PORTS
r0wadfsir91i  vote_visualizer.1  dockersamples/visualizer:stable               manager-1  Running        Running 2 minutes ago         
t06c27xx664r  vote_result.1      dockersamples/examplevotingapp_result:before  manager-1  Running        Running 2 minutes ago      
```

**List the services**

```sh
$ docker service ls
```

Result:
```sh

```


### Inspect the stack

**List the services populated:**
```sh
$ docker service ls
```

Result (on manager-1):
```sh
b9nwytxeq069  vote_redis       replicated  2/2       redis:alpine
gza2rjds04v7  vote_worker      replicated  1/1       dockersamples/examplevotingapp_worker:latest
jbniw7bicr2e  vote_result      replicated  1/1       dockersamples/examplevotingapp_result:before
os5h3rh1zb6o  vote_visualizer  replicated  1/1       dockersamples/visualizer:stable
wh6x724zu5t3  vote_db          replicated  1/1       postgres:9.4
y0ua5c5ud2jb  vote_vote        replicated  2/2       dockersamples/examplevotingapp_vote:beforedocker servi
```


### Inspect the services

Get more information about a particular service
```sh
$ docker service ps <service_name>

# eg the service vote_vote
# docker service ps vote_vote
```

Result (```docker service ps vote_vote```):
```sh
ID            NAME         IMAGE                                       NODE      DESIRED STATE  CURRENT STATE          ERROR  PORTS
ren8c26sfq00  vote_vote.1  dockersamples/examplevotingapp_vote:before  worker-3  Running        Running 5 minutes ago         
qjqvqqmcqk8x  vote_vote.2  dockersamples/examplevotingapp_vote:before  worker-1  Running        Running 5 minutes ago      
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

