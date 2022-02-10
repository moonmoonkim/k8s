### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("${var.template_dir_path}",
  {
    # haproxy-ips = var.haproxy_ips
    control-ips = var.k8s_cp_ips
    worker-ips = var.k8s_worker_ips
  }
  )
  filename = "${var.ansible_dir_path}/inventory.ini"
  file_permission = "0644"
}

### The Ansible inventory group var file for all
# resource "local_file" "AnsibleGroupVarAll" {
# 	content = templatefile("${var.template_all_dir_path}",{
# 		s3_bucket_name = var.s3_bucket_name
# 	})
# 	filename = "${var.ansible_dir_path}/group_vars/all/all.yaml"
# 	file_permission = "0644"
# }

### The Ansible inventory group var file for haproxy
# resource "local_file" "AnsibleGroupVarHaproxynode" {
# 	content = templatefile("${var.template_haproxy_node_dir_path}",{
# 		control-ips = var.k8s_cp_ips,
#     worker-ips = var.k8s_worker_ips,
# 		s3_bucket_name = var.s3_bucket_name
# 	})
# 	filename = "${var.ansible_dir_path}/group_vars/haproxy_node/haproxy_node.yaml"
# 	file_permission = "0644"
# }

### The Ansible ssh config file
resource "local_file" "AnsibleSSHConfig" {
  content = templatefile("${var.templates_ssh_dir_path}",
  {
    bastion_key_path = "/home-mc/moonmoon.kim/Downloads/BASTION.pem"
    # bastion_key_path = "infra/aws/terraform/aws_keys/${var.ssh_private_key_name}_bastion",
    node_key_path = "aws/terraform/aws_keys/${var.ssh_private_key_name}_node",
    public_dns_bastion = var.public_dns_bastion,
    project_path = var.project_path
  }
  )
  filename = "${var.ansible_dir_path}/ssh.cfg"
  file_permission = "0664"
}

### Dev SSH CONFIG
resource "local_file" "DevSSHConfig" {
  content = templatefile("${var.templates_dev_ssh_config}", {
    bastion_key_path = "/home-mc/moonmoon.kim/Downloads/BASTION.pem"
    # bastion_key_path = "infra/aws/terraform/aws_keys/${var.ssh_private_key_name}_bastion",
    node_key_path = "aws/terraform/aws_keys/${var.ssh_private_key_name}_node",
    public_dns_bastion = var.public_dns_bastion,
    user_id = var.user_id,
    project_path = var.project_path
  })
  filename = "${var.root_dir_path}/dev_ssh_config"
  file_permission = "0644"
}

### Dev ssh alias rc
resource "local_file" "DevOnlySSH" {
  content = templatefile("${var.templates_dev_only_ssh}",
  {

    # haproxy-public-dns = var.haproxy_public_dns,
    control_private_ips = var.k8s_cp_ips,
    worker_private_ips = var.k8s_worker_ips,
    project_path = var.project_path
  }
  )
  filename = "${var.root_dir_path}/dev_ssh_alias"
  file_permission = "0644"
}


### The kubespray inventory file
# resource "local_file" "KubesprayInventory" {
#   content = templatefile("${var.templates_kubespray}",
#   {
#     # haproxy-ips = []
#     control-ips = var.k8s_cp_ips,
#     worker-ips = var.k8s_worker_ips
#   }
#   )
#   filename = "${var.root_dir_path}/kubespray/inventory/mycluster/inventory.ini"
#   file_permission = "0644"
# }

### The kubespray group_vars/k8s_cluster/k8s-cluster.yml
# resource "local_file" "KubesprayInventoryGroupvarsK8Scluster" {
#   content = templatefile("templates/kubespray/inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml.tftmpl",
#   {
#   }
#   )
#   filename = "${var.kubespray_dir_path}/inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml"
#   file_permission = "0644"
# }

# ### The kubespray grop_vars/k8s_cluster/addons.yml
# resource "local_file" "KubesprayInventoryGroupvarsAddons" {
#   content = templatefile("templates/kubespray/inventory/mycluster/group_vars/k8s_cluster/addons.yml.tftmpl",
#   {
#   }
#   )
#   filename = "${var.kubespray_dir_path}/inventory/mycluster/group_vars/k8s_cluster/addons.yml"
#   file_permission = "0644"
# }

### The kubespray ssh config file
# resource "local_file" "KubespraySSHConfig" {
#   content = templatefile("templates/kubespray/ssh.cfg.tftmpl",
#   {
#     bastion_key_path = "infra/aws/terraform/aws_keys/${var.ssh_private_key_name}_bastion",
#     node_key_path = "infra/aws/terraform/aws_keys/${var.ssh_private_key_name}_node",
#     public_dns_bastion = var.public_dns_bastion,
#     project_path = var.project_path
#   }
#   )
#   filename = "${var.kubespray_dir_path}/ssh.cfg"
#   file_permission = "0664"
# }

### The kubespray ansible config file
# resource "local_file" "KubesprayAnsibleConfig" {
#   content = templatefile("templates/kubespray/ansible.cfg.tftmpl",
#   {
#   }
#   )
#   filename = "${var.kubespray_dir_path}/ansible.cfg"
#   file_permission = "0664"
# }


