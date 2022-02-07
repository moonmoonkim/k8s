variable "user_id" {
  default = "moonmoon.kim"
  description = "user id"
}

variable "project_name" {
  default = "test"
  description = "project name"
}

variable "vpc_name" {
    default = "vpc"
}

variable "igw_name" {
  default = "igw"
}

variable "natgw_name" {
  default = "nat-gw"
}

variable "eip_ngw_name" {
  default = "nat-gw eip"
} 

variable "route_name" {
  default = "route table"
}


variable "bastion_name" {
  default = "bastion"
}

variable "num_bastion_instances" {
  default = 1
  description = "number of bastion instances"
}

variable "num_azs" {
  default = 3
  description = "number of AZs"
}

variable "sg_name" {
  default = "security group"
}

variable "num_subnet_per_az" {
  default = 1
  description = "number of subnets per AZ"
}

variable "max_subnets_per_topoloogy" {
  default = 10
  description = "max of subnets per network topology"
}

#Subnet
variable "subnet_name" {
  default = "subnet"
}

variable "num_subnets" {
  default = 3
}

variable "ssh_private_key_name" {
  default = "k8s_rsa"
  description = "SSH private key file name"
}

variable "bastion_key_name" {
  default = "test-key-bastion"
}
variable "node_key_name" {
  default = "test-key-node"
}

# Security-groups
variable "sg_cp_name" {
  default = "spc-onboarding-sg-cp"
  description = "security group for controlplan node on onboarding project"
}

variable "sg_worker_name" {
  default = "spc-onboarding-sg-worker"
  description = "security group for worker node on onboarding project"
}


# AMI
variable "ami_common_id" {
  default = "ami-06e7b9c5e0c4dd014"
  description = "common ami"
}

variable "destination_path" {
  default = "/home/ubuntu/id_rsa_node"
}

variable "eip_bastion" {
  default = "eipalloc-0ba494ab4f9d06177"
  description = "Default EIP for bastion server"
}

# { START_CONTROL_PLANE_NODE_VARIABLES
variable "num_k8s_cp_instances" {
  default = 3
  description = "number of k8s-control-plane instances"
}

variable "k8s_cp_vol_type" {
  default     = "gp2"
  description = "root volume type of k8s-control-plane instances"
}

variable "k8s_cp_vol_size" {
  default     = 16
  description = "root volume size of k8s-control-plane instances"
}

variable "cp_name" {
  default = "control-plane"
  description = "Tag name for control plane"
}
# FINISH_CONTROL_PLANE_NODE_VARIABLES }

# { START_WORKER_NODE_VARIABLES
variable "worker_name" {
  default = "worker-node"
  description = "Tag name for worker"
}

variable "num_k8s_worker_instances" {
  default = 2
  description = "number of k8s-worker instances"
}
# FINISH_WORKER_NODE_VARIABLES }


# { START_WORKER_SECONDARY_VARIABLES
variable "k8s_worker_secondary_vol_type" {
  default     = "io1"
  description = "secondary volume type of k8s-worker instances"
}

variable "k8s_worker_secondary_vol_size" {
  default     = 200
  description = "secondary volume size of k8s-worker instances"
}

variable "k8s_worker_secondary_vol_iops" {
  default     = 600
  description = "secondary volume type of k8s-worker instances"
}

variable "ws_name" {
  default = "worker-secondry"
  description = "Tag name for worker-secondary"
}
# FINISH_WORKER_SECONDARY_VARIABLES }