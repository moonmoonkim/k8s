resource "aws_instance" "k8s-worker" {
  count = var.num_k8s_worker_instances

  ami                   = var.ami_common_id
  instance_type         = var.k8s_worker_instance_type
#   iam_instance_profile  = var.iam_role_name
  availability_zone     = var.target_azs[0]
  key_name              = var.key_name_node


  subnet_id = var.subnet_private_ids[0]
  associate_public_ip_address = false

  vpc_security_group_ids = [
    var.vpc_base_sg_id,
    var.worker_sg_id
  ]

  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    delete_on_termination = true
  }

   tags = {
    Name        = "${var.user_id} ${var.tag_worker_name}-${count.index}"
    GBL_CLASS_0 = "TEST"
    GBL_CLASS_1 = "K8SWORKER"
  }

  volume_tags = {
    Name        = "${var.user_id} ${var.tag_worker_name}-${count.index}"
    GBL_CLASS_0 = "TEST"
    GBL_CLASS_1 = "K8SWORKERVOLUME"
  }

  depends_on = [
    var.rt_depends_on,
  ]
}


# resource "aws_ebs_volume" "k8s-worker-secondary" {
#   count = var.num_k8s_worker_instances

#   availability_zone     = var.target_azs[0]

#   type = var.k8s_worker_secondary_vol_type
#   size = var.k8s_worker_secondary_vol_size
#   iops = var.k8s_worker_secondary_vol_iops

#   tags = {
#     Name        = "${var.user_id} ${var.tag_ws_name}-${count.index}"
#     GBL_CLASS_0 = "TEST"
#     GBL_CLASS_1 = "K8SEBS"
#   }
# }

# resource "aws_volume_attachment" "k8s-worker-secondary" {
#   count = var.num_k8s_worker_instances

#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.k8s-worker-secondary[count.index].id
#   instance_id = aws_instance.k8s-worker[count.index].id
# }
