output "bastion_id" {
    value = aws_instance.bastion[0].id
}

output "bastion" {
    value = aws_instance.bastion
}

# output "haproxy" {
#     value = aws_instance.haproxy
# }

# output "haproxy_ips" {
#     value = aws_instance.haproxy.*.private_ip
# }

output "public_dns_bastion" {
    # value = aws_instance.bastion[0].public_dns
    value = data.aws_instance.bastion.public_dns
}

output "public_ip_bastion" {
    value = aws_instance.bastion[0].public_ip
}

output "k8s_cp_ips" {
    value = aws_instance.k8s-control-plane.*.private_ip
}

output "k8s_worker_ips" {
    value = aws_instance.k8s-worker.*.private_ip
}

output "k8s_cp_public_dns" {
    value = aws_instance.k8s-control-plane.*.public_dns
}

output "k8s_worker_public_dns" {
    value = aws_instance.k8s-worker.*.public_dns
}