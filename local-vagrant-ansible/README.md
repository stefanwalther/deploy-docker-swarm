# Local deployment using Vagrant

## Summary

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
  - [Guest Additions for VirtualBox](https://docs.oracle.com/cd/E36500_01/E36502/html/qs-guest-additions.html)
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)
- [Vagrant](https://www.vagrantup.com/)
- [Ansible](https://www.ansible.com/)

### Vagrant plugins

- vagrant-host-shell
- vagrant-alpine
- vagrant-vbguest

The setup script will take care of installing the vagrant dependencies.

## Run

```sh
$ sh deploy.sh
```

## Play with it


## Todos

- [ ] Change the services to use the voting-app from Docker tutorials


## Reference links

Some articles which inspired this work.

- [Vagrant Docker Swarm](http://jamesdmorgan.github.io/2016/docker-swarm/)
- https://github.com/denverdino/docker-swarm-mode-vagrant/blob/master/Vagrantfile
- https://github.com/mrlesmithjr/vagrant-ansible-docker-swarm