data "aws_subnet" "public-subnet1" {
    filter {
      name = "tag:Name"
      values = [var.psaz1_name]
    }
  
}

data "aws_subnet" "public-subnet2" {
    filter {
        name = "tag:Name"
        values = [var.psaz2_name]
    }
  
}

data "aws_security_group" "web-alb-sg" {
    filter {
      name = "tag:Name"
      values = [var.alb-sg-name]
    }
  
}

data "aws_vpc" "vpc" {
    filter {
      name = "tag:Name"
      values = [var.vpc_name]
    }
  
}