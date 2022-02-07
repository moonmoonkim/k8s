# data resources
data "external" "public-source-ip" {
  program = [
    "bash",
    "scripts/get-public-source-ip.bash",
  ]
}

data "aws_availability_zones" "available" {
  state = "available"
}

# data "template_file" "tf-ssh-bastion" {
#   template = "${file("${var.ssh_bastion_tpl_path}")}"

#   vars = {
#     tf_remote_user = "${var.tf_remote_user}"
#     bastion-ip = "${aws_instance.node-test.*.private_ip}"
#   }
# }