# Deploy a swarm cluster on your local machine

## Summary

- Create a few machines in VirtualBox
- Init a swarm (manager + worker nodes)
- Deploys a docker-compose (v3) file

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)

_Note:_ The scripts are only tested on OSX, testing on Windows needs to be done.

## Run

### Setup the environment

```sh
$ sh setup.sh
```

Result:
- You have now several machines in your VirtualBox.
- A swarm has been initialized

Caveats:
- If a machine already exists with the same name (e.g. `manager-1`), then the setup-script will delete the existing one and create a new one.

### Deploy a compose file

Deploy the swarm as defined in `docker-stack.yml`

```sh
$ sh deploy.sh
```

Point to another swarm file:

```
$ sh deploy.sh -f ./docker-stack.modified.yml
```

_Note: _docker-stack.modified.yml is not part of this project, just create it yourself ;-)_

## Configuration

All possible configurations are stored in `config.sh`:

- `NUM_MANAGERS` - Amount of managers to provision.
- `NUM_WORKERS` - Amount of workers to provision.


## Play with it



## Todos

- [ ] Security setup, SSL generation
- [ ] Expose configuration to be arguments (or not?!)
- [ ] If there is not default docker-machine, then we run into troubles.
- [ ] Test on Windows

## Reference links

Some articles which inspired this work.

- [Create a swarm cluster with Docker 1.12 swarm mode](http://lucjuggery.com/blog/?p=566) - Great article, thx a lot.
- https://medium.com/towards-data-science/deploy-a-nodejs-microservices-to-a-docker-swarm-cluster-docker-from-zero-to-hero-464fa1369ea0#.wv1hrp285