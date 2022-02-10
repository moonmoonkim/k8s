# variable "haproxy_ips" {
#   type = list
#   description = "List of haproxy ips"
# }

variable "k8s_cp_ips" {
  type = list
  description = "List of controlplane ips"
}

variable "k8s_worker_ips" {
  type = list
  description = "List of worker ips"
}

# variable "haproxy_public_dns" {
#   type = list
#   description = "List of haproxy public_dns"
# }

variable "k8s_cp_public_dns" {
  type = list
  description = "List of controlplane public_dns"
}

variable "k8s_worker_public_dns" {
  type = list
  description = "List of worker public_dns"
}

# variable "s3_bucket_name" {
# 	type = string
# 	description = "S3 bucket name"
# }

variable "ansible_dir_path" {
    type = string
    description = "ansible directory path"
}

variable "root_dir_path" {
    type = string
    description = "root directory path"
}

# variable "kubespray_dir_path" {
#   type = string
#   description = "kubespray direcotry path"
# }

variable "template_dir_path" {
  default = "templates/ansible/inventory.ini.tftmpl"
  description = "template dir path"
}

variable "template_all_dir_path" {
	default = "templates/ansible/group_vars/all/all.yaml.tftmpl"
	description = "setting all"
}

# variable "template_haproxy_node_dir_path" {
#   default = "templates/ansible/group_vars/haproxy_node/haproxy_node.yaml.tftmpl"
#   description = "setting haproxy"
# }

variable "templates_ssh_dir_path" {
  default = "templates/ansible/ssh.cfg.tftmpl"
}

variable "templates_dev_only_ssh" {
  default = "templates/ansible/dev_ssh_alias.tftmpl"
}

variable "templates_dev_ssh_config" {
  default = "templates/ansible/dev_ssh_config.tftmpl"
}

# variable "templates_kubespray" {
#   default = "templates/kubespray/inventory/mycluster/inventory.ini.tftmpl"
# }

# key-pair
variable "build_dir_path" {
  type = string
  description = "Directory path of build"
}

variable "ssh_private_key_name" {
  default = "id_rsa"
  description = "SSH private key file name"
}

variable "public_dns_bastion" {
  type = string
  description = "bastion public dns"
}

# user name
variable "user_id" {
  type = string
  description = "user name"
}

variable "project_path" {
  type = string
  description = "project root path"
}
