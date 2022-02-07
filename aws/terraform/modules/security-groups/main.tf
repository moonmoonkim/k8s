# Create a security group for ssh connection
resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "security group for bastion server"
  vpc_id      = var.vpc_id

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = [
        "${var.public_source_ip}/32",
    ]
    description = "ssh port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion security group ${var.tag_sg_name}"
  }
}

resource "aws_security_group" "vpc-base" {
  name        = "vpc base"
  description = "base security group"
  vpc_id      = var.vpc_id

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = [
        var.vpc_cidr_block,
    ]
    description = "ssh port"
  }
    
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc basic security group ${var.tag_sg_name}"
  }
}
