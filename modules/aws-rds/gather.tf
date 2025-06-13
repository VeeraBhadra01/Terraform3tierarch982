data "aws_subnet" "DB1Subnet" {
    filter {
      name = "tag:Name"
      values = [var.DB1s_name]
    }
  
}

data "aws_subnet" "DB2subnet" {
    filter {
      name = "tag:Name"
      values = [var.DB2s_name]
    }
  
}
