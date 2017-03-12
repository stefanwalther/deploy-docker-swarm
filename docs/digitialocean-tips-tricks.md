# Some Tips & Tricks to work with DigitalOcean

## Getting the available regions, images and droplet sizes

To get the list of possible regions, sizes, etc from DigitalOcean you can use

- The vagrant-digitalocean plugin
- The [Official DigitalOcean CLI](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client)
- The [DigitalOcean REST API](https://developers.digitalocean.com/documentation/v2/)
 

All the command require that you have first created an API token on DO.
For convenience reasons I have put this into an environment variable `DO_TOKEN`
 
### Get the information using the vagrant-digitalocean plugin
 
List all available regions:
```sh
$ vagrant digitalocean-list regions $DO_TOKEN
```

List the available images:
```sh
$ vagrant digitalocean-list images $DO_TOKEN

```

List the available droplet sizes:
```sh
$ vagrant digitalocean-list sizes $DO_TOKEN
```
 
### Get the information using the DO CLI
 
[Install](https://github.com/digitalocean/doctl) the `doctl` first.
 
List all available regions:
```sh
$ doctl -t $DO_TOKEN compute region list
```
 
List the available images:
```sh
$ doctl -t $DO_TOKEN compute image list
```
 
List the available droplet sizes:
```sh
$ doctl -t $DO_TOKEN compute size list
```
 
### Get the information using the DO REST API
 
List the available regions:
```sh
$ curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/regions" 
```

List the available images:
```sh
$ curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/images?page=1&per_page=1"
```

List the available droplet sizes:
```sh
$ curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/sizes"
```