provider "aws" {
  region = var.region
}


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr

  vpc_name = var.vpc_name

  psaz1_cidr = var.psaz1_cidr

  psaz1_availabilityzone = var.psaz1_availabilityzone

  psaz1_name = var.psaz1_name

  psaz2_cidr = var.psaz2_cidr

  psaz2_availabilityzone = var.psaz2_availabilityzone

  psaz2_name = var.psaz2_name

  prsaz1_cidr = var.prsaz1_cidr

  prsaz1_availabilityzone = var.prsaz1_availabilityzone

  prsaz1_name = var.prsaz1_name

  prsaz2_cidr = var.prsaz2_cidr

  prsaz2_availabilityzone = var.prsaz2_availabilityzone

  prsaz2_name = var.prsaz2_name

  igw_name = var.igw_name

  nat_name = var.nat_name

  public_routename = var.public_routename

  private_routename = var.private_routename

  DB1s_cidr = var.DB1s_cidr

  DB1s_availabilityzone = var.DB1s_availabilityzone

  DB1s_name = var.DB1s_name

  DB2s_cidr = var.DB2s_cidr

  DB2s_availabilityzone = var.DB2s_availabilityzone

  DB2s_name = var.DB2s_name

  DB_routename = var.DB_routename


}