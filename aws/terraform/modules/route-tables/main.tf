## Create a route table for Internet access subnet
resource "aws_route_table" "internet" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.tag_route_name
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.ngw_id
  }

  tags = {
    Name = "private-${var.tag_route_name}"
  }
}

## associate a public subnet with an Internet access route table
resource "aws_route_table_association" "public" {
  count = var.num_subnets_per_topology

  subnet_id      = var.subnet_public_ids[count.index]
  route_table_id = aws_route_table.internet.id

}

resource "aws_route_table_association" "private" {
  count = var.num_subnets_per_topology

  # subnet_id =     = var.subnet_private_id
  subnet_id      = var.subnet_private_ids[count.index]
  route_table_id = aws_route_table.private.id
}