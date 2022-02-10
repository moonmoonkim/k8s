locals {
    # vpc
  tag_vpc_name      = "${var.project_name}-${var.vpc_name}-${var.user_id}"
  tag_igw_name      = "${var.project_name}-${var.igw_name}-${var.user_id}"
  tag_natgw_name    = "${var.project_name}-${var.natgw_name}-${var.user_id}"
  tag_route_name    = "${var.project_name}-${var.route_name}-${var.user_id}"
  tag_subnet_name   = "${var.project_name}-${var.subnet_name}-${var.user_id}"
  tag_bastion_name  = "${var.project_name}-${var.bastion_name}"
  tag_sg_name       = "${var.project_name}-${var.sg_name}-${var.user_id}"
  tag_ngw_eip_name = "${var.project_name}-${var.eip_ngw_name}-${var.user_id}"  
  tag_key_name      = "${var.bastion_key_name}-${var.user_id}"
  tag_key_node_name = "${var.node_key_name}-${var.user_id}"
  tag_cp_name       = "${var.project_name}-${var.cp_name}"
  tag_worker_name   = "${var.project_name}-${var.worker_name}"


  #sg
  sg_cp_name        = "${var.sg_cp_name}-${var.user_id}"
  sg_worker_name    = "${var.sg_worker_name}-${var.user_id}"
  # sg_haproxy_name   = "${var.sg_haproxy_name}-${var.user_id}"

  min_num_aws_instance_bastion = min(var.num_bastion_instances, length(module.instances.bastion))
  subnet_public_ids = module.subnets.public_ids
  subnet_private_ids = module.subnets.private_ids
  num_subnets_per_topology = min(var.num_azs * var.num_subnet_per_az, var.max_subnets_per_topoloogy)

  public_source_ip = data.external.public-source-ip.result.public_source_ip

  build_dir_path = "${path.root}/aws_keys"
  destination_path = var.destination_path

  #ami
  ami_common_id = var.ami_common_id

  #local-files
  ansible_dir_path = "${path.root}/../../ansible"
  root_dir_path = "${path.root}/../.."
}