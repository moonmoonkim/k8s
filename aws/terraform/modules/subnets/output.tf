output "public_ids" {
  value = aws_subnet.public.*.id
  description = "Subnet \"public\" "
}

output "private_ids" {
  value = aws_subnet.private.*.id
  description = "Subnet \"private\" "
}

output "private_cidr_block" {
  value = aws_subnet.private.*.cidr_block
  description = "Subnet cide_bolck \"private\" "
}

output "public_id" {
  value = aws_subnet.public[0].id
  description = "Subnet \"public\" id"
}

# output "private_id" {
#   value = aws_subnet.private[var.num_subnets_per_topology].id
#   description = "Subnet \"private\" id"
# }

# output "subnets_private_cnt" {
#   value = length(aws_subnet.private.*)
#   description = "private subnets count"
# }