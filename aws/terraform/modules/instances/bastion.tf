resource "aws_instance" "bastion" {
  count = var.num_bastion_instances

  ami                       = var.ami_common_id
  instance_type             = var.bastion_instance_type
  availability_zone         = var.target_azs[count.index % length(var.target_azs)]
  key_name                  = var.key_name_bastion

  vpc_security_group_ids = [
    var.bastion_sg_id
  ]
  subnet_id = var.subnet_public_ids[count.index % var.num_subnets_per_topology]
  associate_public_ip_address = true

  tags = {
    Name        = "${var.user_id} ${var.tag_bastion_name}"
    GBL_CLASS_0 = "TEST"
    GBL_CLASS_1 = "BASTION"
  }

  depends_on = [
    var.rt_depends_on,
  ]
}

resource "aws_eip_association" "bastion" {
  count = var.bastion_count

  allocation_id = var.eip_bastion
  instance_id = aws_instance.bastion[count.index].id
}

# resource "null_resource" "private" {
#   count = var.bastion_count

#   connection {
#     type = "ssh"
#     user = var.ssh_user
#     host = data.aws_instance.bastion.public_dns
#     private_key = "${file("${var.local_file_path_bastion}")}"
#   }

#   provisioner "file" {
#     source      = "${var.local_file_path_node}"
#     destination = var.destination_path
#   }

#   depends_on = [ aws_eip_association.bastion ]
# }


data "aws_instance" "bastion" {
  filter {
		name = "instance-id"
		values = [aws_instance.bastion[0].id]
	}

  depends_on = [
    aws_eip_association.bastion
  ]
}