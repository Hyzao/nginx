# main.tf
variable "access_key" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}

variable "organization_id" {
  type = string
  sensitive = true
}

variable "project_id" {
  type = string
  sensitive = true
}

resource "scaleway_instance_ip" "nginx_public_ip" {}


resource "scaleway_instance_server" "nginx" {
  type  = "PLAY2-PICO"
  image = "48191a46-ab14-4b0c-8f9c-65f30f82cb9a" # My base image
  name = "nginx"

  tags = [ "nginx", "training" ]

  ip_id = scaleway_instance_ip.nginx_public_ip.id

    root_volume {
    volume_type = "b_ssd"
    size_in_gb = 30
  }

}

# resource "scaleway_domain_record" "nginx" {
#   dns_zone = "ianducrot.fr"
#   name     = "ian"
#   type     = "A"
#   data     = scaleway_instance_ip.nginx_public_ip.address
#   ttl      = 3600
# }


