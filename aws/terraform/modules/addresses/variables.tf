# variable "num_haproxy_instances" {
#   type = string
#   description = "number of haproxy instances"
# }

variable "igw_depends_on" {
  type = any
  default = null
  description = "Place holder variable for depending internet gateway"
}

# variable "input_haproxy_eip_ids" {
# 	type = list
# 	description = "input haproxy eip ids"
# }

variable "tag_ngw_eip_name" {
  type = string
  description = "tag of ngw eip"
}