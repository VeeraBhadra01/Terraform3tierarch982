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



