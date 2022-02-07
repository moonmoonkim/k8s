resource "aws_nat_gateway" "private" {
  allocation_id = var.nat_gw_eip_id
  subnet_id     = var.subnet_public_id

  depends_on = [
    var.igw_depends_on,
  ]

  tags = {
    Name = var.tag_natgw_name
  }
}
