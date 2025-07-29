# Azure variables
variable "azure_resource_group_name" {
  type        = string
  description = "Azure resource group name"
}

variable "azure_region" {
  type        = string
  description = "Azure region"
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name"
}

variable "aks_dns_prefix" {
  type        = string
  description = "AKS DNS prefix"
}

variable "aks_node_count" {
  type        = number
  default     = 3
}

variable "aks_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
}

# IBM Cloud variables
variable "ibm_region" {
  type        = string
  description = "IBM Cloud region"
}

variable "ibm_resource_group_id" {
  type        = string
  description = "IBM Cloud resource group ID"
}

variable "ibm_vpc_id" {
  type        = string
  description = "IBM Cloud VPC ID"
}

variable "ibm_zones" {
  type        = list(string)
  description = "IBM Cloud zones"
}

variable "ibm_zone" {
  type        = string
  description = "Single zone for VM"
}

variable "ibm_subnet_id" {
  type        = string
  description = "Subnet ID for VM"
}

variable "ibm_ssh_key_id" {
  type        = string
  description = "SSH key ID for VM"
}

# ROKS specific
variable "roks_cluster_name" {
  type        = string
}

variable "roks_flavor" {
  type        = string
  default     = "bx2.4x16"
}

variable "roks_kube_version" {
  type        = string
  default     = "4.14_openshift"
}

variable "roks_worker_count" {
  type        = number
  default     = 3
}

# VM specific
variable "vm_instance_name" {
  type        = string
}

variable "vm_image_id" {
  type        = string
}

variable "vm_profile" {
  type        = string
  default     = "bx2-2x8"
}

# Common tags
variable "common_tags" {
  type    = map(string)
  default = {
    environment = "dev"
    project     = "vault-demo"
  }
}

