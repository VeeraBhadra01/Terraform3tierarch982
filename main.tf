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

module "security-group" {
  source = "./modules/security-group"

  vpc_name = var.vpc_name

  alb-sg-name = var.ALB-SG-Name

  web-sg-name = var.WEB-SG-Name

  db-sg-name = var.DB-SG-NAME

  depends_on = [ module.vpc ]
  
}

module "alb" {
  source = "./modules/alb-sg"
  
  psaz1_name = var.psaz1_name
  
  psaz2_name = var.psaz2_name
  
  alb-sg-name  = var.ALB-SG-Name

  alb-name = var.alb-name
  
  tg-name = var.tg-name
  vpc_name = var.vpc_name

  depends_on = [ module.security-group ]

}

module "iam" {
  source = "./modules/aws-iam"

  iam-role = var.iam-role
  iam-policy = var.iam-policy
  instance-profile-name = var.instance-profile-name

  depends_on = [ module.alb ]
  
}

module "autoscaling" {
  source = "./modules/aws-autoscaling"

  ami_name = var.ami_name
  instance_type = var.instance_type
  launch-template-name = var.launch-template-name
  instance-profile-name = var.instance-profile-name
  web-sg-name = var.WEB-SG-Name
  tg-name = var.tg-name
  psaz1_name = var.psaz1_name
  psaz2_name = var.psaz2_name
  asg-name = var.asg-name

  depends_on = [ module.iam]

}

module "rds" {
  source = "./modules/aws-rds"

  sg-name = var.sg-name
  DB1s_name = var.DB1s_name
  DB2s_name = var.DB2s_name
  db-sg-name = var.db-sg-name 
  rds-username = var.rds-username
  rds-password = var.rds-password
  db-name = var.db-name
  rds-name = var.rds-name


  depends_on = [ module.iam ]
  
}