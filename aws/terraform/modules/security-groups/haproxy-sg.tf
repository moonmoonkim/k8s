# resource "aws_security_group" "haproxy" {
#   name        = var.sg_haproxy_name
#   description = "Access into control plan"
#   vpc_id      = var.vpc_id

#   tags = {
#     Name = "security group (${var.tag_sg_name}) - haproxy"
#   }
# }

# resource "aws_security_group_rule" "haproxy-http-80" {
#   security_group_id = aws_security_group.haproxy.id

#   type = "ingress"
#   from_port = 80
#   to_port = 80
#   protocol = "tcp"
#   cidr_blocks = [
#     "${var.public_source_ip}/32"
#   ]
#   description = "http from digital city"
# }

# resource "aws_security_group_rule" "haproxy-https-443" {
#   security_group_id = aws_security_group.haproxy.id

#   type = "ingress"
#   from_port = 443
#   to_port = 443
#   protocol = "tcp"
#   cidr_blocks = [
#     "${var.public_source_ip}/32"
#   ]
#   description = "https from digital city"
# }

# resource "aws_security_group_rule" "haproxy-nodeports" {
#   security_group_id = aws_security_group.haproxy.id

#   type = "ingress"
#   from_port = 30001
#   to_port = 31010
#   protocol = "tcp"
#   cidr_blocks = [
#     "${var.public_source_ip}/32"
#   ]
#   description = "nodeports from digital city"
# }
