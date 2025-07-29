variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS"
}

variable "node_count" {
  type        = number
  default     = 3
  description = "Number of AKS nodes"
}

variable "vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "VM size for AKS nodes"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}

