variable "cluster_name" {
  type        = string
  description = "ROKS cluster name"
}

variable "region" {
  type        = string
  description = "IBM Cloud region"
}

variable "resource_group_id" {
  type        = string
  description = "IBM Cloud Resource Group ID"
}

variable "flavor" {
  type        = string
  default     = "bx2.4x16"
  description = "Worker node flavor"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the ROKS cluster"
}

variable "zones" {
  type        = list(string)
  description = "List of zones"
}

variable "kube_version" {
  type        = string
  default     = "4.14_openshift"
  description = "OpenShift version"
}

variable "worker_count" {
  type        = number
  default     = 3
  description = "Number of worker nodes"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the cluster"
}

