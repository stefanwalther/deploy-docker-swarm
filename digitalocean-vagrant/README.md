# DigitalOcean & Vagrant

## Prerequisites

- Create a DO account (get $10 for free using this [referral link](https://m.do.co/c/f8b1f8667c34))
- Get a DigitalOcean access-token as described [here](https://docs.docker.com/machine/examples/ocean/#step-2-generate-a-personal-access-token)
- [Vagrant](https://www.vagrantup.com/)
- [Vagrant plugin for DigitalOcean](https://github.com/devopsgroup-io/vagrant-digitalocean) (will be installed automatically)
- Create an SSH key for DO ([as described here](./../docs/digitalocean-ssh-setup.md))

## Run

Run with default options (2 manager, 2 workers).
```sh
$ vagrant up
```

## Configuration

Open the `Vagrantfile` and change the configuration options at the top of the file:

- `NUM_OF_MANAGERS` - Number of managers to create (defaults to `2`).
- `NUM_OF_WORKERS` - Number of workers to create (defaults to `2`).
- `MEMORY` - Allocated memory for each of the machines (defaults to `1024`)
- `NUM_CPUS` - Allocated number of CPUs for each of the machines (defaults ot `2`)

## Todos

- [ ] Test with a clean account to describe the SSH dependencies/setup better

## Reference links