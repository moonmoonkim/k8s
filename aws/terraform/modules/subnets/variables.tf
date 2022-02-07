variable "tag_subnet_name" {
  default = ""
  description = "name of tag"
}

variable "num_subnets_per_topology" {
    default = 1
    ## TODO Modify description
    description = "count"
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}

variable "target_azs" {
  type = list
  description = "List of selected target availability zones"
}

variable "pub_subnets_cidr" {
  default = [
    "172.31.0.0/24",
    "172.31.1.0/24",
    "172.31.2.0/24",
  ]
}

variable "priv_subnets_cidr" {
  default = [
    "172.31.5.0/24",
    "172.31.6.0/24",
    "172.31.7.0/24",
  ]
}

variable "no_internet_subnets_cidr" {
  default = [
    "172.31.10.0/24",
    "172.31.11.0/24",
    "172.31.12.0/24",
  ]
}

variable "num_subnets" {
  default = 1
  description = ""
}