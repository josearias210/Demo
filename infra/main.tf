variable "image_id" {
  type= "string"
}

resource "digitalocean_tag" "demo" {
  name = "demo"
}

resource "digitalocean_droplet" "web" {
  count  = 2
  image  = "${var.image_id}"
  name   = "demo-03"
  region = "nyc3"
  size   = "512mb"
  ssh_keys = [14506728]
  tags   = ["${digitalocean_tag.demo.id}"]

  lifecycle {
     create_before_destroy = true
  }

  provisioner "local-exec" {
    command = "sleep 180 && curl ${self.ipv4_address}:80"
  }

  user_data = <<EOF
#cloud-config
coreos:
  units:
    - name: "demo.service"
      command: "start"
      content: |
        [Unit]
        Description=demo
        After=docker.service

        [Service]
        ExecStart=/usr/bin/docker run -d -p 80:80 demo
EOF
}

resource "digitalocean_loadbalancer" "demo" {
  name = "demo"
  region = "nyc3"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 80
    protocol = "http"
    path = "/"
  }

  droplet_tag = "${digitalocean_tag.demo.name}"
}