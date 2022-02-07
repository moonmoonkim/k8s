# output "haproxy_ids" {
#   # value = aws_eip.haproxy.*.id
#   value = data.aws_eip.haproxy.*.id
#   description = "haproxy ids"
# }

# output "haproxy_public_dns" {
#   # value = aws_eip.haproxy.*.public_dns
#   value = data.aws_eip.haproxy.*.public_dns
#   description = "haproxy public dns"
# }

output "nat_gw_eip_id" {
  value = aws_eip.nat-gw.id
  description = "nat gateway id"
}
