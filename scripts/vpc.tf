resource "aws_vpc" "vpc" {
  cidr_blocks = var.cidr_block
  name = var.vpc_name
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_blocks = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.ig_name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route = {
    cidr_blocks = "0.0.0.0/0"
    internet_gateway_id = aws_internet_gateway.ig.id
  }
}

resource "aws_rout_table_association" "rt-association" {
   route_table_id = aws_route_table.rt.id
   subnet_id = aws_subnet.subnet.id
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.vpc.id
  ingress [
    for port in [22, 8080, 9000, 9090, 80] : {
      protocol = "tcp"
      from_port = port
      to_port = port
      cidr_blocks = ["0.0.0.0/0"]
      description = "TLS from vpc"
      ipv6_cidr_blocks = ["::/0"]
      security_groups = []
   }
 ]

egress [
  description = "outbound"
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = ["0.0.0.0/0"]
]
tags = {
  Name = var.sg_name
}

 

  
