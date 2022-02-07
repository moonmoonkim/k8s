output "key_name_bastion" {
  value = aws_key_pair.bastion.key_name
  description = "Key pair name for bastion instances"
}

output "key_name_node" {
  value = aws_key_pair.node.key_name
  description = "Key pair name for node instances"
}

output "local_file_bastion" {
  value = local_file.bastion.filename
  description = "Key pair local file name for bastion"
}

output "local_file_node" {
  value = local_file.node.filename
  description = "Key pair local file name for bastion"
}