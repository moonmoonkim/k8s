resource "aws_security_group" "cp" {
  name        = var.sg_cp_name
  description = "Access into control plan"
  vpc_id      = var.vpc_id

  tags = {
    Name = "security group (${var.tag_sg_name}) - control plane"
  }
}

resource "aws_security_group_rule" "cp-ingress-6443" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 6443
  to_port = 6443
  protocol = "tcp"
  cidr_blocks = [
    var.vpc_cidr_block
  ]
  description = "kube-apiserver"
}

resource "aws_security_group_rule" "cp-ingress-8080" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  cidr_blocks = [
    var.vpc_cidr_block
  ]
  description = "kube-apiserver"
}

resource "aws_security_group_rule" "cp-ingress-etcd" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 2379
  to_port = 2380
  protocol = "tcp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "etcd"
}

resource "aws_security_group_rule" "cp-ingress-kubelet" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 10250
  to_port = 10250
  protocol = "tcp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "kubelet in subnet"
}

resource "aws_security_group_rule" "cp-ingress-scheduler" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 10251
  to_port = 10251
  protocol = "tcp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "kube-scheduler"
}

resource "aws_security_group_rule" "cp-ingress-manager" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 10252
  to_port = 10252
  protocol = "tcp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "kube-controller-manager"
}

resource "aws_security_group_rule" "cp-ingress-8285" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 8285
  to_port = 8285
  protocol = "udp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "flannel overlay network(udp backend)"
}

resource "aws_security_group_rule" "cp-ingress-8472" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = 8472
  to_port = 8472
  protocol = "udp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "flannel overlay network(vxlan backend)"
}

resource "aws_security_group_rule" "cp-ingress-icmp" {
  security_group_id = aws_security_group.cp.id

  type = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"
  cidr_blocks = [
    var.vpc_cidr_block
  ]
  description = "icmp"
}



