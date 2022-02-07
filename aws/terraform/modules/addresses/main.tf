# resource "aws_eip" "haproxy" {
#   count = "${length(var.input_haproxy_eip_ids) == 0 ? var.num_haproxy_instances: 0}"

#   vpc = true

#   depends_on = [
#     var.igw_depends_on,
#   ]

#   tags = {
#     Name = "haproxy-${format("%02d", count.index + 1)}"
#   }
# }

# data "aws_eip" "haproxy" {
#   filter {
# 		name = "allocation-id"
# 		values = "${length(var.input_haproxy_eip_ids) == 0 ? aws_eip.haproxy.*.id: var.input_haproxy_eip_ids}"
# 	}

#   depends_on = [
#     aws_eip.haproxy
#   ]
# }

resource "aws_eip" "nat-gw" {
  vpc = true

  depends_on = [
    var.igw_depends_on,
  ]

  tags = {
    Name = var.tag_ngw_eip_name
  }
}
