variable "region" {}

variable "vpc_cidr" {}

variable "vpc_name" {}

#Public Subnet{AZ1}

variable "psaz1_cidr" {}

variable "psaz1_availabilityzone" {}

variable "psaz1_name" {}

# Public Subnet{AZ2}

variable "psaz2_cidr" {}

variable "psaz2_availabilityzone" {}

variable "psaz2_name" {}

#Private Subnet{AZ1}

variable "prsaz1_cidr" {}

variable "prsaz1_availabilityzone" {}

variable "prsaz1_name" {}

#Private Subnet{Az2}

variable "prsaz2_cidr" {}

variable "prsaz2_availabilityzone" {}

variable "prsaz2_name" {}

#Internet Gateway

variable "igw_name" {}

#NAT gateway

variable "nat_name" {}

#Route Table

variable "public_routename" {}

variable "private_routename" {}

#Data base

variable "DB1s_cidr" {}

variable "DB1s_availabilityzone" {}

variable "DB1s_name" {}

variable "DB2s_cidr" {}

variable "DB2s_availabilityzone" {}

variable "DB2s_name" {}

variable "DB_routename" {}

# Security group variables
variable "VPC-Name" {}

variable "ALB-SG-Name" {}

variable "WEB-SG-Name" {}

variable "DB-SG-NAME" {}

# Application load balancer

variable "alb-name" {}

variable "tg-name" {}

#Iam creation

variable "iam-role" {}

variable "iam-policy" {}

variable "instance-profile-name" {}

# Define variables for asg

variable "ami_name" {}
variable "launch-template-name" {}
variable "asg-name" {}
variable "instance_type" {}

# Creating aurora database write and read replicas

variable "sg-name" {}
variable "rds-username" {}
variable "rds-password" {}
variable "db-sg-name" {}
variable "db-name" {}
variable "rds-name" {}



