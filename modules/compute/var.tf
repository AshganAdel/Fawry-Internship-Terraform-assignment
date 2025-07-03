variable "vpc_id"              { type = string }
variable "instance_count"      { type = number }
variable "public_subnet_ids"   { type = list(string) }
variable "env"              { type = string }
variable "cidr_block"   { type = string }
