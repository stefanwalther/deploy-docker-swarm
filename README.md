# deploy-docker-swarm

> Deploy scripts for docker-swarm to different (cloud-)providers and using differrent tools such as bash, Vagrant, Ansible, Terraform.

## Summary
This repository contains different implementation approaches how to deploy docker-swarm to various environments respectively cloud-providers, using different tooling.

All implementation scenarios follow the "voting-app" example Docker has provided: [https://docs.docker.com/engine/getstarted-voting-app/](https://docs.docker.com/engine/getstarted-voting-app/) 

All scenarios are created in a generic, re-usable way. Switching from deploying the voting-app to your services, should be pretty easy and straightforward.

**Caution:**
I am by no means an expert in this area. Working on the different scenarios primarily helped me to test the different approaches as a novice in this area. **Therefore any contribution, comment or PR is highly welcome**.

## Scenarios

- Scenario 1: [Local deployment to VirtualBox using bash only](./local-bash)
- Scenario x: Local deployment to VirtualBox using Vagrant only
- Scenario x: Local deployment to VirtualBox using Vagrant/Ansible 
- Scenario x: Deployment to DigitalOcean using bash only
- Scenario x: Deployment to DigitalOcean using Vagrant only
- Scenario x: Deployment to DigitalOcean using Vagrant/Ansible
- Scenario x: Using rancher to deploy locally (?)
- Scenario x: Using rancher to deploy to DigitalOcean
- Scenario x: Deployment to AWS using Vagrant only

_Note:_ Scenarios not being linked to a solution are not started/finished, yet.

## Install

Clone the [GitHub repository](https://github.com/stefanwalther/deploy-docker-swarm) , install the required tools and enjoy:

```sh
$ git clone https://github.com/stefanwalther/deploy-docker-swarm
```

## Tools being used

Different tools have been used each of the scenarios, which also allows to compare the different approaches:
 
- [VirtualBox](https://www.virtualbox.org/)
  - [Guest Additions for VirtualBox](https://docs.oracle.com/cd/E36500_01/E36502/html/qs-guest-additions.html)
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)
- [Vagrant](https://www.vagrantup.com/)
- [Ansible](https://www.ansible.com/)
- [Terraform](https://www.terraform.io/)

Have a look at the README of the corresponding scenario to understand which of the tools are needed.

## Comparison of the different approaches used
Just a personal opinion having worked on all these examples.  
(_Feel free to comment, add your findings or just disagree_)

### Bash

Pros:

- Gives you full control and feels more direct
- No conversion from the docker-compose file to another format necessary (e.g. compared to Ansible)
- Easy to extend and adapt

Cons:

- Scripting work needed
- Not necessarily platform agnostic (e.g. compared to the usage of Vagrant/Ansible)
- Completely different implementation on local vs. a cloud-provider implementation

### Vagrant/Ansible

Pros:

- Platform agnostic approach, both Vagrant and Ansible support Windows & MAC/OSX

Cons:

- Conversion of the docker-compose file necessary

## About

### Contributing
Comments, Issues and PR are highly welcome.

### Author
**Stefan Walther**

* [github/stefanwalther](https://github.com/stefanwalther)
* [twitter/waltherstefan](http://twitter.com/waltherstefan)

## License
MIT

