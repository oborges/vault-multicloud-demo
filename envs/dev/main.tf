############################################
# Terraform CLI & required providers
############################################
terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.60.0"
    }
  }
}

############################################
# Provider configurations
############################################
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

# Single IBM Cloud provider (region set via variable)
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.ibm_region
}
############################################
# AKS (Azure Kubernetes Service) module
############################################
module "azure_aks" {
  source              = "../../modules/azure-aks"
  resource_group_name = var.azure_resource_group_name
  location            = var.azure_region
  cluster_name        = var.aks_cluster_name
  dns_prefix          = var.aks_dns_prefix
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
}

############################################
# ROKS (IBM Cloud OpenShift) module
############################################
module "ibm_roks" {
  source  = "github.com/oborges/ibmcloud-infra-terraform//modules/roks?ref=main"
  region            = var.ibm_region
  cluster_name      = var.roks_cluster_name
  vpc_name          = var.ibm_vpc_name
  zones             = var.ibm_zones          # set(string)
  subnet_ids        = var.ibm_subnet_ids     # map(zone => subnet_id)
  kube_version      = var.roks_kube_version
  worker_flavor     = var.roks_flavor
  workers_per_zone  = var.roks_worker_count
  create_cos        = true
  cos_name          = "vaultdemo-cos"
}

############################################
# Helpful outputs
############################################
output "aks_kube_config" {
  value       = module.azure_aks.kube_config
  description = "Kubeconfig for the AKS cluster (sensitive)"
  sensitive   = true
}
