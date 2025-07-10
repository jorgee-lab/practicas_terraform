resource "aws_vpc" "vpc_lab_tf" {
  cidr_block = var.vpc_lab_tf_cidr
    tags = {
    Name = "vpc_lab_tf"
    # env = "Dev"
    # tags = var.tags
  }
}

resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.vpc_lab_tf.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet_temp"
  # tags = var.tags
  }
}

resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.vpc_lab_tf.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "PrivateSubnet_temp"
  # tags = var.tags
  }
  depends_on = [
    aws_subnet.PublicSubnet
  ]
}