variable "bastion_instance_type" {
  default = "t3.micro"
  description = "instance type of bastion"
}

variable "haproxy_instance_type" {
  default = "t3.medium"
  description = "instance type of haproxy"
}

variable "k8s_etcd_instance_type" {
  default = "t3.medium"
  description = "instance type of k8s-etcd"
}

variable "k8s_worker_instance_type" {
  default = "c5.4xlarge"
  description = "instance type of k8s-worker"
}

variable "k8s_cp_instance_type" {
  default = "t3.2xlarge"
  description = "instance type of k8s-control-plane"
}