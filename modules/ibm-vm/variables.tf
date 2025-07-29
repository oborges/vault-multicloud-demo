variable "instance_name" {
  type        = string
  description = "Name of the virtual server"
}

variable "image_id" {
  type        = string
  description = "IBM Cloud image ID"
}

variable "profile" {
  type        = string
  default     = "bx2-2x8"
  description = "Flavor profile of the instance"
}

variable "zone" {
  type        = string
  description = "Zone where the instance will be deployed"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "ssh_key_id" {
  type        = string
  description = "ID of the SSH key"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the VM"
}

