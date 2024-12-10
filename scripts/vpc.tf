resource "aws_vpc" {
  cidr_block = var.cidr_block
  name = var.vpc_name
}

resource "aws_subnet" "subnet" {
  
