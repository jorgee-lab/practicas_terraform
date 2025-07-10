
resource "aws_instance" "web_instance" {
  ami                     = "ami-05ffe3c48a9991133"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.PublicSubnet.id
  key_name = data.aws_key_pair.key.key_name
  tags = {
    Name = "web_instance"
  }
}