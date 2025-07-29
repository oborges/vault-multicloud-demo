terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.60"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

provider "ibm" {}

# AKS cluster (Azure)
module "azure_aks" {
  source              = "../../modules/azure-aks"
  resource_group_name = var.azure_resource_group_name
  location            = var.azure_region
  cluster_name        = var.aks_cluster_name
  dns_prefix          = var.aks_dns_prefix
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
  tags                = var.common_tags
}

# ROKS cluster (IBM Cloud)
module "ibm_roks" {
  source             = "../../modules/ibm-roks"
  cluster_name       = var.roks_cluster_name
  region             = var.ibm_region
  resource_group_id  = var.ibm_resource_group_id
  flavor             = var.roks_flavor
  vpc_id             = var.ibm_vpc_id
  zones              = var.ibm_zones
  kube_version       = var.roks_kube_version
  worker_count       = var.roks_worker_count
  tags               = var.common_tags
}

# Virtual Machine (IBM Cloud)
module "ibm_vm" {
  source        = "../../modules/ibm-vm"
  instance_name = var.vm_instance_name
  image_id      = var.vm_image_id
  profile       = var.vm_profile
  zone          = var.ibm_zone
  vpc_id        = var.ibm_vpc_id
  subnet_id     = var.ibm_subnet_id
  ssh_key_id    = var.ibm_ssh_key_id
  tags          = var.common_tags
}

