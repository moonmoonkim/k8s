variable "rt_depends_on" {
  type = any
  default = null
  description = "Place holder variable for depending route table"
}

variable "num_bastion_instances" {
  default = 1
  description = "number of bastion instances"
}

variable "num_haproxy_instances" {
  default = 1
  description = "number of haproxy instances"
}


variable "test_instance_type" {
  default = "t2.micro"
}

variable "key_name_node" {
  type = string
  description = "Key pair name for node instances"
}

variable "key_name_bastion" {
  type = string
  description = "Key pair name for bastion instances"
}

variable "local_file_path_bastion" {
  type = string
  description = "Key pair path for bastion instances"
}

variable "local_file_path_node" {
  type = string
  description = "Key pair path for node instances"
}

# variable "tf_remote_user" {
#   default = "ubuntu"
# }

# variable "ssh_bastion_tpl_path" {
#   default = "templates/inventory.ini.tftmpl"
# }

variable "user_id" {
  type = string
  description = "user id"
}

variable "bastion_sg_id" {
  type = string
  description = "Security Group ID for bastion server"
}

variable "vpc_base_sg_id" {
  type = string
  description = "Security Group ID for vpc-base"
}

variable "subnet_public_ids" {
  type = list
  description = "List of public subnet ids"
}

variable "subnet_private_ids" {
  type = list
  description = "List of private subnet ids"
}

variable "tag_bastion_name" {
  default = ""
  description = "Bastion Server name of tags"
}

variable "bastion_count" {
  default = 1
  description = "Bastion Server Count"
}

# variable "haproxy_sg_id" {
#   type = string
#   description = "Security Group ID for haproxy"
# }

# variable "tag_haproxy_name" {
#   default = ""
#   description = "haproxy name of tags"
# }
# variable "haproxy_count" {
#   default = 1
#   description = "HAProxy Count"
# }

variable "num_subnets_per_topology" {
  default = 1
  description = "num_subnets_per_topology"
}

variable "target_azs" {
  type = list
  description = "List of selected target availability zones"
}

# variable "eip_haproxy_ids" {
#   type = list
#   description = "List of haproxy eip"
# }

variable "eip_bastion" {
  type = string
  description = "Default EIP for bastion server"
}

variable "ssh_user" {
  default = "centos"
  description = "The User name for Connection"
}

variable "destination_path" {
  type = string
  description = "Destination Path for Move to File"
}

# AMI
variable "ami_common_id" {
  type = string
  description = "common ami"
}


# { START_CONTROL_PLANE_NODE_VARIABLES
variable "num_k8s_cp_instances" {
  type = number
  description = "number of k8s-control-plane instances"
}

variable "k8s_cp_vol_type" {
  type        = string
  description = "root volume type of k8s-control-plane instances"
}

variable "k8s_cp_vol_size" {
  type        = number
  description = "root volume size of k8s-control-plane instances"
}

variable "cp_sg_id" {
  type = string
  description = "Security Group ID for control plane"
}

variable "tag_cp_name" {
  type = string
  description = "Control Plane name of tags"
}

# FINISH_CONTROL_PLANE_NODE_VARIABLES }

# {START_WORKER_NODE_VARIABLES
variable "num_k8s_worker_instances" {
  type = number
  description = "number of k8s-worker instances"
}

variable "tag_worker_name" {
  type = string
  description = "Worker node name of tags"
}

variable "worker_sg_id" {
  type = string
  description = "Security Group ID for worker"
}

# variable "iam_role_name" {
#   type = string
#   description = "role name for s3 access policy"
# }
# FINISH_WORKER_NODE_VARIABLES }

# # { START_WORKER_SECONDARY_VARIABLES
# variable "k8s_worker_secondary_vol_type" {
#   type        = string
#   description = "secondary volume type of k8s-worker instances"
# }

# variable "k8s_worker_secondary_vol_size" {
#   type        = number
#   description = "secondary volume size of k8s-worker instances"
# }

# variable "k8s_worker_secondary_vol_iops" {
#   type        = number
#   description = "secondary volume type of k8s-worker instances"
# }

# variable "tag_ws_name" {
#   type        = string
#   description = "Tag name for worker-secondary"
# }
# FINISH_WORKER_SECONDARY_VARIABLES }