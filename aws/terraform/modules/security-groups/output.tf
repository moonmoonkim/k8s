output "bastion_sg_id" {
  value = aws_security_group.bastion.id
  description = "Security Group ID for bastion server"
}

output "vpc_base_sg_id" {
  value = aws_security_group.vpc-base.id
  description = "Security Group ID for vpc base"
}

output "cp_sg_id" {
  value = aws_security_group.cp.id
  description = "Security Group ID for control plane"
}

output "worker_sg_id" {
  value = aws_security_group.worker.id
  description = "Security Group ID for worker"
}

# output "haproxy_sg_id" {
#   value = aws_security_group.haproxy.id
#   description = "Security Group ID for worker"
# }