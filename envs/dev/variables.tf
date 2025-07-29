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
  description = "IBM Cloud API key passed down to child modules"
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
  default     = "bx2.4x16"
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

########################################################
# VM‑specific variables (module mirrors oborges/vsi)
########################################################
variable "vm_instance_name" {
  type        = string
  description = "Name of the virtual server instance (VSI)"
}

variable "ibm_zone" {
  type        = string
  description = "Single availability zone used for the VSI (e.g. us-south-1)"
}

variable "ibm_subnet_id" {
  type        = string
  description = "Subnet ID in which the VSI will be placed"
}

variable "vm_image_name" {
  type        = string
  description = "Public image name for the VSI (e.g. ibm-redhat-9-6-minimal-amd64-2)"
  default     = "ibm-redhat-9-6-minimal-amd64-2"
}

variable "vm_profile" {
  type        = string
  description = "Compute profile for the VSI (e.g. bx2-2x8)"
  default     = "bx2-2x8"
}

variable "ibm_ssh_key_name" {
  type        = string
  description = "Name of an existing IBM Cloud SSH key to reuse (blank = auto‑generate)"
  default     = ""
}

variable "vm_attach_fip" {
  type        = bool
  description = "Whether to attach a floating IP to the VSI"
  default     = true
}

variable "vm_allowed_ssh_cidr" {
  type        = string
  description = "CIDR block allowed for SSH inbound traffic"
  default     = "0.0.0.0/0"
}

########################################################
# Common tags / environment label
########################################################
variable "environment" {
  type        = string
  description = "Environment label (dev, stage, prod)"
  default     = "dev"
}

