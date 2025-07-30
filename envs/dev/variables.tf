########################################################
# Azure variables
########################################################

variable "azure_resource_group_name" {
  type        = string
  description = "Resource group in which the AKS cluster will be created"
}

variable "azure_region" {
  type        = string
  description = "Azure region (e.g. eastus, westeurope)"
}

variable "aks_cluster_name" {
  type        = string
  description = "Name of the Azure Kubernetes Service (AKS) cluster"
}

variable "aks_dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS API server"
}

variable "aks_node_count" {
  type        = number
  description = "Initial node count for the default node pool"
  default     = 3
}

variable "aks_vm_size" {
  type        = string
  description = "VM size (SKU) for AKS worker nodes"
  default     = "Standard_DS2_v2"
}

########################################################
# IBM Cloud variables (common)
########################################################

variable "ibmcloud_api_key" {
  type        = string
  sensitive   = true
  description = "IBM Cloud API key for provider authentication"
}

variable "ibm_region" {
  type        = string
  description = "IBM Cloud region (e.g. us-south, eu-gb)"
}

variable "ibm_vpc_name" {
  type        = string
  description = "Name of an existing VPC used by both ROKS and the VM"
}

########################################################
# ROKS‑specific variables (module mirrors oborges/roks)
########################################################
variable "roks_cluster_name" {
  type        = string
  description = "Name of the OpenShift (ROKS) cluster"
}

variable "roks_kube_version" {
  type        = string
  description = "OpenShift version string, e.g. 4.15_openshift (blank = latest GA)"
  default     = ""
}

variable "roks_flavor" {
  type        = string
  description = "Worker node flavor (e.g. bx2.4x16)"
  default     = "bx2-2x8"
}

variable "roks_worker_count" {
  type        = number
  description = "Number of workers per zone"
  default     = 3
}

variable "ibm_zones" {
  type        = set(string)
  description = "Set of zones for the ROKS worker pool (e.g. [\"us-south-1\", \"us-south-2\", \"us-south-3\"])"
}

variable "ibm_subnet_ids" {
  type        = map(string)
  description = "Map of zone name => subnet ID for each ROKS zone"
}

variable "cos_crn" {
  description = "CRN of a *standard* Cloud Object Storage instance used by ROKS"
  type        = string
}


########################################################
# Common tags / environment label
########################################################
variable "environment" {
  type        = string
  description = "Environment label (dev, stage, prod)"
  default     = "dev"
}

