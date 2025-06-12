data "aws_subnet" "DB_az1_subnet" {
    filter {
      name = "tag:Name"
      values = [var.DB1s_name]
    }
  
}

data "aws_subnet" "DB_az2_subnet" {
    filter {
      name = "tag:Name"
      values = [var.DB2s_name]
    }
  
}

data "aws_security_group" "database-sg" {
    filter {
      name = "tag:Name"
      values = [var.db-sg-name]
    }
  
}