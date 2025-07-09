resource "aws_vpc" "vpc_lab_terraform" {
  cidr_block = "10.10.0.0/16"
    tags = {
    Name = "vpc_lab_terrafor"
    env = "Dev"
  }
}

resource "aws_vpc" "vpc_lab_terraform2" {
  cidr_block = "10.20.0.0/16"
    tags = {
    Name = "vpc_lab_terraform2"
    env = "Dev"
  }
}