variable "ami" {
  description = "The AMI ID for the instances"
}

variable "instance_type" {
  description = "The type of instance"
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
}

variable "subnet_id" {
  description = "The subnet ID for the instances"
}

variable "vpc_security_group_ids" {
  description = "The list of existing security group IDs for the instances"
  type        = list(string)
}

variable "num_masters" {
  description = "The number of master instances to create"
  type        = number
}

variable "num_workers" {
  description = "The number of worker instances to create"
  type        = number
}

variable "instance_name" {
  description = "The base name for the instances"
}

