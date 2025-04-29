output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_az1_subnet.id, aws_subnet.public_az2_subnet.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_az1_subnet.id, aws_subnet.private_az2_subnet.id]
}

output "DB_subnet_ids" {
    value = [aws_subnet.DB_az1_subnet.id, aws_subnet.DB_az2_subnet.id]
  
}

