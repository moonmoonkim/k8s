variable "igw_depends_on" {
  type = any
  default = null
  description = "Place holder variable for depending internet gateway"
}

variable "nat_gw_eip_id" {
  type = string
  description = "EIP id"
}

variable "subnet_public_id" {
  type = string
  description = "Subnet 'public' id"
}

variable "tag_natgw_name" {
  type = string
  description = "Tag name of nat-gateway"
}
