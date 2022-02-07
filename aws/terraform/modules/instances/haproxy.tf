# resource "aws_instance" "haproxy" {
#   count = var.num_haproxy_instances

#   ami                       = var.ami_common_id
#   instance_type             = var.haproxy_instance_type
#   availability_zone         = var.target_azs[count.index % length(var.target_azs)]
#   key_name                  = var.key_name_node

#   vpc_security_group_ids = [
#     var.vpc_base_sg_id,
#     var.haproxy_sg_id
#   ]

#   subnet_id = var.subnet_public_ids[count.index % var.num_subnets_per_topology]
#   associate_public_ip_address = true

#   tags = {
#     Name        = "${var.user_id} ${var.tag_haproxy_name}"
#     GBL_CLASS_0 = "TEST"
#     GBL_CLASS_1 = "HAPROXY"
#   }

#   depends_on = [
#     var.rt_depends_on,
#     var.haproxy_sg_id
#   ]
# }

# resource "aws_eip_association" "haproxy" {
#   count = var.haproxy_count

#   allocation_id = var.eip_haproxy_ids[count.index]
#   instance_id = aws_instance.haproxy[count.index].id
# }
