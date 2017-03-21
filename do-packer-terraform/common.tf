resource "digitalocean_ssh_key" "docker" {
  name = "do-packer-terraform"
  public_key = "${file("./.ssh/do-packer-terraform.pub")}"
}


resource "digitalocean_floating_ip" "docker_1" {
  droplet_id = "${digitalocean_droplet.swarm-manager.0.id}"
  region = "${var.swarm_region}"
}

resource "digitalocean_floating_ip" "docker_2" {
  droplet_id = "${digitalocean_droplet.swarm-manager.1.id}"
  region = "${var.swarm_region}"
}

resource "digitalocean_floating_ip" "docker_3" {
  droplet_id = "${digitalocean_droplet.swarm-manager.2.id}"
  region = "${var.swarm_region}"
}

output "floating_ip_1" {
  value = "${digitalocean_floating_ip.docker_1.ip_address}"
}

output "floating_ip_2" {
  value = "${digitalocean_floating_ip.docker_2.ip_address}"
}

output "floating_ip_3" {
  value = "${digitalocean_floating_ip.docker_3.ip_address}"
}
