resource "aws_security_group" "worker" {
  name        = var.sg_worker_name
  description = "Access into worker"
  vpc_id      = var.vpc_id

  tags = {
    Name = "security group (${var.tag_sg_name}) - worker"
  }
}

resource "aws_security_group_rule" "worker-ingress-svc" {
  security_group_id = aws_security_group.worker.id

  type = "ingress"
  from_port = 30000
  to_port = 32767
  protocol = "tcp"
  cidr_blocks = [
    var.vpc_cidr_block
  ]
  description = "kubernetes svc nodeport"
}

resource "aws_security_group_rule" "worker-ingress-kubelet" {
  security_group_id = aws_security_group.worker.id

  type = "ingress"
  from_port = 10250
  to_port = 10250
  protocol = "tcp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "kubelet in subnet"
}

resource "aws_security_group_rule" "worker-ingress-flannel-udp" {
  security_group_id = aws_security_group.worker.id

  type = "ingress"
  from_port = 8285
  to_port = 8285
  protocol = "udp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "flannel overlay network(udp backend)"
}

resource "aws_security_group_rule" "worker-ingress-flannel-vxlan" {
  security_group_id = aws_security_group.worker.id

  type = "ingress"
  from_port = 8472
  to_port = 8472
  protocol = "udp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "flannel overlay network(vxlan backend)"
}

resource "aws_security_group_rule" "worker-ingress-http" {
  security_group_id = aws_security_group.worker.id

  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [
    var.private_cidr_block[0]
  ]
  description = "http"
}


resource "aws_security_group_rule" "worker-icmp" {
  security_group_id = aws_security_group.worker.id

  type = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"
  cidr_blocks = [
    var.vpc_cidr_block
  ]
  description = "icmp"
}
