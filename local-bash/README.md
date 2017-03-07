# Deploy a swarm cluster on your local machine

## Purpose

- Create a few machines in VirtualBox
- Init a swarm (manager + worker nodes)
- Deploys a docker-compose file

## Prerequisites

- Docker for Mac
- VirtualBox

_Note:_ The scripts are only tested on OSX, deployment on Windows will be covered in another example.

## Configuration

All possible configurations are stored in `00-config.sh`:

## Run

### Setup the environment

```sh
$ sh setup.sh
```

Result:
- You have now several machines in your VirtualBox (as defined in `00-config.sh`).
- A swarm has been initialized

Caveats:
- If a machine already exists with the same name (e.g. `manager-1`), then the setup-script will delete the existing one and create a new one.

### Deploy a compose file

## Todos

- [ ] Better error handling
- [ ] If there is not default docker-machine, then we run into troubles.

## Reference links

Some articles which inspired this approach.

- [Create a swarm cluster with Docker 1.12 swarm mode](http://lucjuggery.com/blog/?p=566) - Great article, thx a lot.
