variable "build_dir_path" {
  type = string
  description = "Directory path of build"
}

variable "ssh_private_key_name" {
  default = "id_rsa"
  description = "SSH private key file name"
}

variable "tag_key_name" {
  type = string
  description = "Key name of tags"
}

variable "tag_key_node_name" {
    type = string
    description = "node key name of tags"
}