resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = var.vpc_name
    }
  
}


resource "aws_subnet" "public_az1_subnet" {
    vpc_id = aws_vpc.vpc.id

    cidr_block = var.psaz1_cidr

    availability_zone = var.psaz1_availabilityzone

    map_public_ip_on_launch = true

    tags = {
      Name = var.psaz1_name
    }
  
}


resource "aws_subnet" "public_az2_subnet" {
    vpc_id = aws_vpc.vpc.id

    cidr_block = var.psaz2_cidr

    availability_zone = var.psaz2_availabilityzone

    map_public_ip_on_launch = true

    tags = {
        Name = var.psaz2_name
    }
  
}

resource "aws_subnet" "private_az1_subnet" {
    vpc_id = aws_vpc.vpc.id

    cidr_block = var.prsaz1_cidr

    availability_zone = var.prsaz1_availabilityzone

    map_public_ip_on_launch = false

    tags = {
      Name = var.prsaz1_name
    }
  
}

resource "aws_subnet" "private_az2_subnet" {
    vpc_id = aws_vpc.vpc.id

    cidr_block = var.prsaz2_cidr

    availability_zone = var.prsaz2_availabilityzone

    map_public_ip_on_launch = false

    tags = {
      Name = var.prsaz2_name
    }
  
}


resource "aws_internet_gateway" "my_igw" {

    vpc_id = aws_vpc.vpc.id

    tags = {
      Name = var.igw_name
    }
  
}

resource "aws_route_table" "public_route_table" {

    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"

        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
      Name = var.public_routename
    }
  
}


resource "aws_route_table_association" "public_az1_association" {

    subnet_id = aws_subnet.public_az1_subnet.id

    route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "public_az2_association" {

    subnet_id = aws_subnet.public_az2_subnet.id

    route_table_id = aws_route_table.public_route_table.id
  
}


resource "aws_eip" "nat_eip" {
  
}

resource "aws_nat_gateway" "my-nat" {

    allocation_id = aws_eip.nat_eip.id

    subnet_id = aws_subnet.private_az1_subnet.id

    tags = {
      Name = var.nat_name
    }
  
}

resource "aws_route_table" "private_route_table" {

    vpc_id = aws_vpc.vpc.id

    route  {
        cidr_block = "0.0.0.0/0"

        nat_gateway_id = aws_nat_gateway.my-nat.id

    }

    tags = {
      Name = var.private_routename
    }
  
}

resource "aws_route_table_association" "private_az1_association" {

    subnet_id = aws_subnet.private_az1_subnet.id

    route_table_id = aws_route_table.private_route_table.id
  
}


resource "aws_route_table_association" "private_az2_association" {

    subnet_id = aws_subnet.private_az2_subnet.id

    route_table_id = aws_route_table.private_route_table.id
  
}


resource "aws_subnet" "DB_az1_subnet" {

    vpc_id = aws_vpc.vpc.id

    cidr_block = var.DB1s_cidr

    availability_zone = var.DB1s_availabilityzone

    map_public_ip_on_launch = false

    tags = {
      Name = var.DB1s_name
    }
  
}


resource "aws_subnet" "DB_az2_subnet" {

    vpc_id = aws_vpc.vpc.id

    cidr_block = var.DB2s_cidr

    availability_zone = var.DB2s_availabilityzone

    map_public_ip_on_launch = false

    tags = {
      Name = var.DB2s_name
    }
  
}

resource "aws_route_table" "DB_route_table" {

    vpc_id = aws_vpc.vpc.id

    tags = {
      Name = var.DB_routename
    }

  
}


resource "aws_route_table_association" "DB_az1_association" {

    subnet_id = aws_subnet.DB_az1_subnet.id

    route_table_id = aws_route_table.DB_route_table.id
  
}

resource "aws_route_table_association" "DB_az2_association" {

    subnet_id = aws_subnet.DB_az2_subnet.id

    route_table_id = aws_route_table.DB_route_table.id
  
}



