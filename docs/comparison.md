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
- Completely different implementation on local vs. a cloud-provider implementation


## Vagrant/Ansible

Pros:

- Platform agnostic approach, both Vagrant and Ansible support Windows & MAC/OSX

Cons:

- Conversion of the docker-compose file necessary