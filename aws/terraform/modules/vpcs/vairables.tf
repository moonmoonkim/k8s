## VPC
variable "vpc_cidr" {
  default = "172.31.0.0/16"
  description = "CIDR of vpc"
}

variable "tag_vpc_name" {
    default = ""
    description = "terraform test"
}

