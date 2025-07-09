resource "aws_vpc" "vpc_lab_tf" {
  cidr_block = var.vpc_lab_tf_cidr
    tags = {
    Name = "vpc_lab_tf"
    env = "Dev"
  }
}

resource "aws_vpc" "vpc_lab_tf2" {
  cidr_block = var.vpc_lab_tf_cidr2
    tags = {
    Name = "vpc_lab_tf2"
    env = "Dev"
  }
}
