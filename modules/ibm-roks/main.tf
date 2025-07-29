provider "ibm" {}

resource "ibm_container_vpc_cluster" "this" {
  name              = var.cluster_name
  region            = var.region
  resource_group_id = var.resource_group_id
  flavor            = var.flavor
  vpc_id            = var.vpc_id
  zones             = var.zones
  kube_version      = var.kube_version
  worker_count      = var.worker_count
  entitlement       = "cloud_pak"
  wait_for_worker_update = true

  tags = var.tags
}

output "kube_config" {
  value     = ibm_container_vpc_cluster.this.config_file_raw
  sensitive = true
}

