
resource "aws_instance" "web_instance" {
  ami                     = "ami-05ffe3c48a9991133"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.PublicSubnet.id 
  #subnet_id = aws_subnet.PrivateSubnet.id #(Se modifica en Lab Lifecycles para comprobar que primero creara el recurso antes de destruir el cambio)
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_web_instance.id]
  tags = {
    Name = "web_instance"
  }

  # lifecycle {
  #   create_before_destroy = true (permite que se cree el recurso antes de destruirlo para ejecutar el cambio de subred)
    #prevent_destroy = true (No destruye el recurso, se puede utilizar en recursos criticos.)
    #ignore_changes = [ami] ignota los cambios ejecutados en los parametros mencionados.
# }
}