# Deploying to DigitalOcean Using Packer & Terraform

## Prerequisites

- [packer](http://packer.io)
- [terraform](http://terraform.io) (version 0.9+)
- Environment variable `DIGITALOCEAN_API_TOKEN` exposing the DigitalOcean API token

### Optional prerequisites

- [Graphviz](http://graphviz.org/)
_(only needed for visualizing the terraform plan)_

## Run

Create the image:
```sh
$ TBD
```

Deploy the terraform plan:
```sh
$ TBD
```

Or do altogether:
```sh
$ sh go.sh
```

Destroy the deployed plan (& cleanup):
```sh
$ sh destroy.sh
```


## Notes:

packer command:
```sh
$ packer build -machine-readable packer-ubuntu-docker.json | tee packer-ubuntu-docker.log
```

Create keygen:
```sh
# -f - filename
# -N - passphrase
# -q - quiet mode
$ ssh-keygen -t rsa -f ./do-packer-terraform -N '' 
```

## Terraform:

### Enable Logging
```sh
$ export TF_LOG=1
```

### Plan

Output the plan:
```sh
$ terraform graph
```

Visualize the plan:
```sh
$ terraform graph | dot -Tpng > graph.png
```


```sh
$ terraform plan -target digitalocean_droplet.swarm-manager -target digitalocean_droplet.swarm-worker
```

### Apply the plan

```sh
$ terraform apply -target digitalocean_droplet.swarm-manager -target digitalocean_droplet.swarm-worker
```

```sh
$ terraform apply \
  -target digitalocean_droplet.swarm-manager \
  -var swarm_init=true \
  -var swarm_managers=1
```

### Destroy

```sh
$ terraform destroy -force
```

## Todos

- [ ] Make the number of mangers & workers fully dynamic in all scripts & outputs
- [ ] Store certs in a sub-folder
- [ ] Store logs in a sub-folder
- [ ] Store terraform logs in a sub-folder
- [ ] Destroy snapshots created by packer
- [ ] Rename the packer image


## Reference links:

- [The DevOps 2.1 Toolkit](https://leanpub.com/the-devops-2-1-toolkit)
  - Code: https://github.com/vfarcic/cloud-provisioning/tree/master/terraform/do