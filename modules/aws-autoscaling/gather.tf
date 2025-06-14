data "aws_ami" "ami" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu-eks-pro/k8s_1.31/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    owners = ["099720109477"]
}

data "aws_security_group" "web-sg" {
    filter {
      name = "tag:Name"
      values = [var.web-sg-name]
    }
  
}

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

data "aws_lb_target_group" "tg" {
    tags = {
      Name = var.tg-name
    }
  
}


data "aws_iam_instance_profile" "instance-profile" {
    name = var.instance-profile-name
  
}