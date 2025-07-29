provider "ibm" {}

resource "ibm_is_instance" "this" {
  name           = var.instance_name
  image          = var.image_id
  profile        = var.profile
  zone           = var.zone
  vpc            = var.vpc_id
  primary_network_interface {
    subnet = var.subnet_id
  }

  keys = [var.ssh_key_id]

  tags = var.tags
}

