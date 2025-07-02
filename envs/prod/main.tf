variable "instance_count" { type = number }
variable "cidr_block" { type = string }
variable "subnet_count" {
  type = number
}
module "compute" {
  source = "../../modules/compute"
  vpc_id = module.network.vpc_id
  instance_count = var.instance_count
  public_subnet_ids = module.network.public_subnet_ids
}

module "network" {
  source = "../../modules/network"
  cidr_block = var.cidr_block
  subnet_count = var.subnet_count 
}

#module "logging" {
#  source = "../../modules/logging"
#  vpc_id = module.network.vpc_id
#  flow_log_role_arn = "arn:aws:iam::568838099888:role/poc-prod-vpc-flow-logs-role"
#}
