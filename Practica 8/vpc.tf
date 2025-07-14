
###### VPC ######

resource "aws_vpc" "vpc_lab_tf" {
  cidr_block = var.vpc_lab_tf_cidr
    tags = {
    Name = "vpc_lab_tf"
    # env = "Dev"
    # tags = var.tags
  }
}

###### Subred Publica ######

resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.vpc_lab_tf.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
  # tags = var.tags
  }
}

###### Subred Privada ######

resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.vpc_lab_tf.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "PrivateSubnet"
  # tags = var.tags
  }
  depends_on = [
    aws_subnet.PublicSubnet
  ]
}

###### Internet Gateway ######

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_lab_tf.id

  tags = {
    Name = "igw vpc lab tf "
  }
}

###### Tabla se enrutamiento ######

resource "aws_route_table" "Publicrtb" {
  vpc_id = aws_vpc.vpc_lab_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Rtb"
  }
}

resource "aws_route_table_association" "rtb_public_subnet" {
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.Publicrtb.id
}

###### Grupo de Seguridad ######

resource "aws_security_group" "sg_web_instance" {
  name        = "sdefag_web_instanceult"
  description = "sg_web_instance VPC security group"
  vpc_id      = aws_vpc.vpc_lab_tf.id

  tags = {
    Name = "sg_web_instance"
  }

  ingress {
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
    cidr_blocks       = [var.sg_ingress_cidr]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}