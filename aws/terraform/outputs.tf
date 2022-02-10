output "public_source_ip" {
  value = data.external.public-source-ip.result.public_source_ip
  description = "Public source IP of terraform controller"
}

# output "tag_common_name" {
#   value = local.tag_common_name
#   description = "Common name of Tags"
# }

output "az_names" {
  value = data.aws_availability_zones.available.names
  description = "List of availability zones"
}

// outputs of "randoms" modules
output "chosen_az_names" {
  value = module.randoms.chosen_az_names
  description = "Chosen availability zones"
}

// outputs of "vpcs" modules
output "vpc_id" {
  value = module.vpc.id
  description = "VPC id"
}

output "vpc_main_rt_id" {
  value = module.vpc.main_route_table_id
  description = "VPC main Route Table id"
}

output "vpc_def_sg_id" {
  value = module.vpc.def_sg_id
  description = "VPC default Security Group id"
}


// outputs of "internet-gateways" modules
output "igw_id" {
  value = module.internet-gateway.id
  description = "Internet Gateway id"
}


// outputs of "subnets" modules
output "subnet_public_ids" {
  value = module.subnets.public_ids
  description = "Subnet 'public' ids"
}

output "subnet_private_ids" {
  value = module.subnets.private_ids
  description = "Subnet 'private' ids"
}

// outputs of "key-pairs" modules
output "key_name_bastion" {
  value = module.key-pairs.key_name_bastion
  description = "Key pair name for bastion instances"
}

output "bastion_sg_id" {
  value = module.security-groups.bastion_sg_id
  description = "Security group id of 'bastion'"
}

output "vpc_base_sg_id" {
  value = module.security-groups.vpc_base_sg_id
  description = "Security group id of 'vpc_base'"
}

output "file_path" {
    value = local.build_dir_path
    description = "file path"
}

output "public_dns_bastion" {
    value = module.instances.public_dns_bastion
}

output "public_ip_bastion" {
    value = module.instances.public_ip_bastion
}