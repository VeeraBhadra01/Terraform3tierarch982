data "aws_subnet" "private-subnet1" {
    filter {
      name = "tag:Name"
      values = [var.prsaz1_name]
    }
  
}

data "aws_subnet" "private-subnet2" {
    filter {
      name = "tag:Name"
      values = [var.prsaz2_name]
    }
  
}

data "aws_vpc" "vpc" {
    filter {
      name = "tag:Name"
      values = [var.vpc_name]
    }
  }

data "aws_security_group" "web-tier-app" {
  filter {
    name = "tag:Name"
    values = [var.web-sg-name]
  }
  
}


