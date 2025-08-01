variable "instance_count" { type = number }
variable "cidr_block" { type = string }
variable "subnet_count" {
  type = number
}
variable "env" { type = string }
module "compute" {
  source = "../../modules/compute"
  vpc_id = module.network.vpc_id
  instance_count = var.instance_count
  public_subnet_ids = module.network.public_subnet_ids
  env = var.env
  cidr_block = var.cidr_block
}

module "network" {
  source = "../../modules/network"
  cidr_block = var.cidr_block
  subnet_count = var.subnet_count 
  env = var.env
}

module "logging" {
  source = "../../modules/logging"
  vpc_id = module.network.vpc_id
}

module "ecr" {
  source = "../../modules/ecr"
}
