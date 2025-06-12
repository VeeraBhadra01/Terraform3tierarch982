region = "us-east-1"

vpc_cidr = "192.168.1.0/25"

vpc_name = "my_vpc"

psaz1_cidr = "192.168.1.0/28"

psaz1_availabilityzone = "us-east-1a"

psaz1_name = "my-ps1"

psaz2_cidr = "192.168.1.16/28"

psaz2_availabilityzone = "us-east-1b"

psaz2_name = "my-ps2"

prsaz1_cidr = "192.168.1.32/28"

prsaz1_availabilityzone = "us-east-1a"

prsaz1_name = "my-prs1"

prsaz2_cidr = "192.168.1.48/28"

prsaz2_availabilityzone = "us-east-1b"

prsaz2_name = "my-prs2"

igw_name = "my-igw"

nat_name = "my-nat"

public_routename = "my-publicroute"

private_routename = "my-privateroute"

DB1s_cidr = "192.168.1.64/28"

DB1s_availabilityzone = "us-east-1a"

DB1s_name = "DB1subnet"

DB2s_cidr = "192.168.1.80/28"

DB2s_availabilityzone = "us-east-1b"

DB2s_name = "DB2subnet"

DB_routename = "DB-routename"

VPC-Name = "my_vpc"

ALB-SG-Name = "alb-sg-application"

WEB-SG-Name = "web-sg-application"

DB-SG-NAME = "Db-sg"

# Application load balancer

alb-name = "alb-webtier-application"

tg-name = "alt-tg-application-groups"

# Creating iam role

iam-role = "iam-role-for-ec2-ssm"

iam-policy = "iam-policy-for-ec2-ssm"

instance-profile-name = "iam-instance-profile-for-ec2-ssm"

# Auto scalling group

ami_name = "New-AMI"

launch-template-name = "web-template"

asg-name = "two-tier-asg"

instance_type = "t2.micro"

# rds variable values

sg-name = "two-tier-rds-sg"

rds-username = "admin"

rds-password = "admin1234"

db-name = "myappdb"

rds-name = "two-tier-rds"

db-sg-name = "data-rds-sg"