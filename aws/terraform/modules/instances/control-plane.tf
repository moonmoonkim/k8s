resource "aws_instance" "k8s-control-plane" {
  count = var.num_k8s_cp_instances

  ami               = var.ami_common_id
  instance_type     = var.k8s_cp_instance_type
#   iam_instance_profile = var.iam_role_name
  availability_zone = var.target_azs[0]
  key_name          = var.key_name_node

  vpc_security_group_ids = [
    var.vpc_base_sg_id,
    var.cp_sg_id
  ]

  subnet_id = var.subnet_private_ids[0]
  associate_public_ip_address = false

  root_block_device {
    volume_type = var.k8s_cp_vol_type
    volume_size = var.k8s_cp_vol_size
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.user_id} ${var.tag_cp_name}-${count.index}"
    GBL_CLASS_0 = "TEST"
    GBL_CLASS_1 = "K8SMASTER"
  }
  volume_tags = {
    Name        = "${var.user_id} ${var.tag_cp_name}-${count.index}"
    GBL_CLASS_0 = "TEST"
    GBL_CLASS_1 = "CPVOLUME"
  }

  depends_on = [
    var.rt_depends_on,
  ]
}
