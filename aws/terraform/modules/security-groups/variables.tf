variable "public_source_ip" {
  type = string
  description = "Public source IP"
}

variable "tag_sg_name" {
  default = ""
  description = "name of tag"
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}

variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR"
}

variable "private_cidr_block" {
  type = list
  description = "Private Subnets CIDR"
}

variable "sg_cp_name" {
  type = string
  description = "Control Plane name of tags"
}

variable "sg_worker_name" {
  type = string
  description = "Worker name of tags"
}

# variable "sg_haproxy_name" {
#   type = string
#   description = "HAProxy name of tags"
# }