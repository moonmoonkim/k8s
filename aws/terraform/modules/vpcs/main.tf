## Create a vpc
resource "aws_vpc" "vpc" {
  cidr_block         = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = var.tag_vpc_name
  }
}