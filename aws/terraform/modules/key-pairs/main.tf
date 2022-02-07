resource "tls_private_key" "bastion" {
  algorithm = "RSA"
}

resource local_file "bastion" {
  sensitive_content = tls_private_key.bastion.private_key_pem
  filename = "${var.build_dir_path}/${var.ssh_private_key_name}_bastion"
  file_permission = "0600"
}

resource "aws_key_pair" "bastion" {
  key_name   = var.tag_key_name
  public_key = tls_private_key.bastion.public_key_openssh
}

resource "tls_private_key" "node" {
  algorithm = "RSA"
}

resource local_file "node" {
  sensitive_content = tls_private_key.bastion.private_key_pem
  filename = "${var.build_dir_path}/${var.ssh_private_key_name}_node"
  file_permission = "0600"
}

resource "aws_key_pair" "node" {
  key_name   = var.tag_key_node_name
  public_key = tls_private_key.bastion.public_key_openssh
}
