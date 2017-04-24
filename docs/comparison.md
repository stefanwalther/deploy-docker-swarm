# Comparison of the different approaches

Just a personal opinion having worked on all these examples.  
(_Feel free to comment, add your findings or just disagree_)

## Bash

Pros:

- Gives you full control and feels more direct
- No conversion from the docker-compose file to another format necessary (e.g. compared to Ansible)
- Easy to extend and adapt

Cons:

- Scripting work needed
- Not necessarily platform agnostic (e.g. compared to the usage of Vagrant/Ansible)
- Pretty similar implementation on local vs. a cloud-provider implementation (if there is a docker-machine provider available)

Conclusion:

- Good to learn, but probably not more than that.

## Vagrant

Pros:

- Platform agnostic
- Many providers, such as VirtualBox, AWS, Azure, DigitalOcean, etc.

Cons:

- Provisioning machines works perfectly in Vagrant, but the tool is just not built for deploying the swarm at the same time.

## Vagrant/Ansible

Pros:

- Platform agnostic approach, both Vagrant and Ansible support Windows & MAC/OSX

Cons:

- Conversion of the docker-compose file necessary