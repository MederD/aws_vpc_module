variable "cidr_block_vpc" {
    type        = string
    description = "The CIDR block for the VPC."
}

variable "region" {
    type        = string
    description = "Region for the aws resources."
}

variable "prefix" {
    type        = string
    description = "Prefix for resource tags."
}

variable "instance_tenancy" {
    type        = string
    description = "Desired tenancy of the instances. Valid values are dedicated, host and default."
}

variable "sub_cidr_public" {
    description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
    type = list
}

variable "sub_cidr_private" {
    description = "Subnet CIDRs for private subnets (length must match configured availability_zones)"
    type = list
}

variable "az_public" {
	type        = list(string)
    description = "Availibility zones for the public subnets."
}

variable "az_private" {
	type        = list(string)
    description = "Availibility zones for the private subnets."
}