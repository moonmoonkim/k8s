module "randoms" {
  source = "./modules/randoms"

  az_names = data.aws_availability_zones.available.names
  num_azs = var.num_azs
}

module "vpc" {
  source = "./modules/vpcs"
  tag_vpc_name = local.tag_vpc_name
}

module "internet-gateway" {
  source = "./modules/internet-gateways"

  vpc_id = module.vpc.id
  tag_igw_name = local.tag_igw_name
}

module "subnets" {
  source = "./modules/subnets"

  target_azs                = module.randoms.chosen_az_names
  vpc_id                    = module.vpc.id
  tag_subnet_name           = local.tag_subnet_name
  num_subnets               = var.num_subnets
  num_subnets_per_topology  = local.num_subnets_per_topology
}

module "addresses" {
  source = "./modules/addresses"

  # num_haproxy_instances     = local.min_num_aws_instance_haproxy
  # input_haproxy_eip_ids     = var.input_haproxy_eip_ids
  tag_ngw_eip_name          = local.tag_ngw_eip_name
  igw_depends_on = [
    module.internet-gateway,
  ]
}

module "nat-gateway" {
  source = "./modules/nat-gateways"

  tag_natgw_name = local.tag_natgw_name
  nat_gw_eip_id = module.addresses.nat_gw_eip_id
  subnet_public_id = module.subnets.public_id
}

module "route-tables" {
  source = "./modules/route-tables"

  vpc_id               = module.vpc.id
  main_route_table_id  = module.vpc.main_route_table_id
  igw_id               = module.internet-gateway.id
  ngw_id               = module.nat-gateway.id
  subnet_public_ids    = module.subnets.public_ids
  subnet_private_ids   = module.subnets.private_ids
  tag_route_name       = local.tag_route_name
  num_subnets_per_topology  = local.num_subnets_per_topology
}

module "key-pairs" {
  source = "./modules/key-pairs"

  build_dir_path       = local.build_dir_path
  ssh_private_key_name = var.ssh_private_key_name
  tag_key_name         = local.tag_key_name
  tag_key_node_name    = local.tag_key_node_name
}

module "security-groups" {
  source = "./modules/security-groups"

  tag_sg_name         = local.tag_sg_name
  sg_cp_name          = local.sg_cp_name
  sg_worker_name      = local.sg_worker_name
  # sg_haproxy_name     = local.sg_haproxy_name

  vpc_id              = module.vpc.id
  vpc_cidr_block      = module.vpc.cidr_block
  private_cidr_block  = module.subnets.private_cidr_block

  public_source_ip    = data.external.public-source-ip.result.public_source_ip
}

module "instances" {
  source ="./modules/instances"
  
  bastion_sg_id             = module.security-groups.bastion_sg_id
  target_azs                = module.randoms.chosen_az_names
  num_subnets_per_topology  = local.num_subnets_per_topology
  tag_bastion_name          = local.tag_bastion_name
  bastion_count             = local.min_num_aws_instance_bastion

  #common
  ami_common_id             = local.ami_common_id
  subnet_public_ids         = local.subnet_public_ids
  subnet_private_ids        = local.subnet_private_ids
  user_id                   = var.user_id

  #bastion
  key_name_bastion          = module.key-pairs.key_name_bastion
  local_file_path_bastion   = module.key-pairs.local_file_bastion
  local_file_path_node      = module.key-pairs.local_file_node
  destination_path          = local.destination_path
  eip_bastion               = var.eip_bastion

  #haproxy instance
  vpc_base_sg_id            = module.security-groups.vpc_base_sg_id
  # haproxy_sg_id             = module.security-groups.haproxy_sg_id
  # haproxy_count             = local.min_num_aws_instance_haproxy
  # tag_haproxy_name          = local.tag_haproxy_name
  # eip_haproxy_ids           = local.eip_haproxy_ids
  # key_name_node             = module.key-pairs.key_name_node
  
  # #control plan node
  # tag_cp_name               = local.tag_cp_name
  # k8s_cp_vol_type           = var.k8s_cp_vol_type
  # k8s_cp_vol_size           = var.k8s_cp_vol_size
  # num_k8s_cp_instances      = var.num_k8s_cp_instances
  # k8s_cp_instance_type      = var.k8s_cp_instance_type
  
  # cp_sg_id                  = module.security-groups.cp_sg_id
  # rt_depends_on = [
  #   module.route-tables,
  # ]

  # #worker node
  # tag_worker_name           = local.tag_worker_name
  # num_k8s_worker_instances  = var.num_k8s_worker_instances
  # k8s_worker_instance_type  = var.k8s_worker_instance_type
  # worker_sg_id              = module.security-groups.worker_sg_id
  # iam_role_name             = module.iam-instance-profiles.name

  # #worker secondary
  # k8s_worker_secondary_vol_type = var.k8s_worker_secondary_vol_type
  # k8s_worker_secondary_vol_size = var.k8s_worker_secondary_vol_size
  # k8s_worker_secondary_vol_iops = var.k8s_worker_secondary_vol_iops
  # tag_ws_name                   = local.tag_ws_name
}