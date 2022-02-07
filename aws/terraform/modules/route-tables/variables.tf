variable "vpc_id" {
  type = string
  description = "VPC id"
}

variable "igw_id" {
  type = string
  description = "Internet Gateway ID"
}

variable "tag_route_name" {
  default = ""
  description = "Route Table name of tags"
}

variable "num_subnets_per_topology" {
  default = 1
  ## TODO Modify description
  description = "count"
}

variable "subnet_public_ids" {
  type = list
  description = "Public Subnet IDs"
}

variable "subnet_private_ids" {
  type = list
  description = "Private Subnet IDs"
}

variable "main_route_table_id" {
  type = string
  description = "Main Route Table ID"
}

variable "ngw_id" {
  type = string
  description = "NAT gateway id"
}

# variable "subnet_private_cnt" {
#   default = 1
#   description = "Private Subnet Count"
# }