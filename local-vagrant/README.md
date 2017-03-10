
## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
  - [Guest Additions for VirtualBox](https://docs.oracle.com/cd/E36500_01/E36502/html/qs-guest-additions.html)
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)
- [Vagrant](https://www.vagrantup.com/)

## Run

If you have already installed all of the pre-requisites, then you are ready to go!

Run with default options (1 manager, 2 workers).
```sh
$ vagrant up
```

This will provision 1 manager, 2 workers and deploy, initialize a docker swarm and deploy the services as defined in `docker-stack.yml`.

## Configuration

Open the `Vagrantfile` and change the configuration options at the top of the file:

- `NUM_OF_MANAGERS` - Number of managers to create (defaults to `1`).
- `NUM_OF_WORKERS` - Number of workers to create (defaults to `2`).
- `MEMORY` - Allocated memory for each of the machines (defaults to `1024`)
- `NUM_CPUS` - Allocated number of CPUs for each of the machines (defaults ot `2`)

Save the file and run

```sh
$ vagrant up
```

## Play with it

Open the UIs:

- Swarm visualizer: [http://192.168.50.100:8080](http://192.168.50.100:8080) 
- Voting app: [http://192.168.50.100:5000](http://192.168.50.100:5000)
- Voting results: [http://192.168.50.100:5001](http://192.168.50.100:5001)
- [Portainer](http://portainer.io/) : [http://192.168.50.100:9000](http://192.168.50.100:9000)

ssh into a machine:
```sh
$ vagrant ssh <machine-name>
```

List the nodes in the swarm:

```sh
$ vagrant ssh manager-1
vagrant@manager-1:~$ docker node ls
```


Destroy machine + resources created:
```sh
$ vagrant destroy --force
```
Stops the running machine Vagrant is managing and destroys all resources that were created during the machine creation process
[Vagrant => destroy](https://www.vagrantup.com/docs/cli/destroy.html)

## Todos

- [ ] Security setup, SSL generation

## Reference links

- [Docker swarm mode sample app](https://docs.docker.com/engine/getstarted-voting-app/) 
- [Code sample docker swarm mode](https://github.com/eyal-lupu/vagrant-docker-swarm-mode/blob/master/Vagrantfile)