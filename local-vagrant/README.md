
## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
  - [Guest Additions for VirtualBox](https://docs.oracle.com/cd/E36500_01/E36502/html/qs-guest-additions.html)
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)
- [Vagrant](https://www.vagrantup.com/)

## Run

Run with default options (1 manager, 2 workers).
```sh
$ sh setup.sh
```

Run with options:
```sh

# -m - Amount of managers (defaults to 1)
# -w - Amount of workers (defaults to 2)
# -s - Memory allocation per machine (defaults to 1024)

$ sh setup.sh -m 2 -w 3 -s 1024
```