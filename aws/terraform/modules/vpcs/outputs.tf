output "id" {
    value = aws_vpc.vpc.id
    description = "VPC ID"
}
output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
  description = "CIDR block of vpc"
}

output "main_route_table_id" {
  value = aws_vpc.vpc.main_route_table_id
  description = "Route Table ID"
}

# output "def_nacl_id" {
#   value = aws_vpc.scs-v2.default_network_acl_id
#   description = "Default Network ACL id of vpc"
# }

output "def_sg_id" {
  value = aws_vpc.vpc.default_security_group_id
  description = "Default Security Group id of vpc"
}