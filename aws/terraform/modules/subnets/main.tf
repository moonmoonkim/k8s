## Create public subnet
resource "aws_subnet" "public" {
  count = var.num_subnets_per_topology

  vpc_id                  = var.vpc_id
  availability_zone       = var.target_azs[count.index % length(var.target_azs)]
  cidr_block              = var.pub_subnets_cidr[count.index]
  ### map_public_ip_on_launch - (Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false.
  map_public_ip_on_launch = true

  tags = {
    Name = "public subent - ${count.index + 1} ${var.tag_subnet_name}"
  }
}

resource "aws_subnet" "private" {
  count = var.num_subnets

  vpc_id                  = var.vpc_id
  availability_zone       = var.target_azs[count.index % length(var.target_azs)]
  cidr_block              = var.priv_subnets_cidr[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "private subent - ${count.index + 1} ${var.tag_subnet_name}"
  }
}

# resource "aws_subnet" "no-internet" {
#   count = var.num_subnets

#   vpc_id                  = var.vpc_id
#   availability_zone       = var.target_azs[count.index % length(var.target_azs)]
#   cidr_block              = var.no_internet_subnets_cidr[count.index]
#   map_public_ip_on_launch = false

#   tags = {
#     Name = "no internet subnet - ${count.index + 1} ${var.tag_subnet_name}"
#   }
# }
