
resource "aws_instance" "web_instance" {
  # ami                     = "ami-05ffe3c48a9991133"
  # instance_type           = "t2.micro"
  ami = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id = aws_subnet.PublicSubnet.id 
  #subnet_id = aws_subnet.PrivateSubnet.id #(Se modifica en Lab Lifecycles para comprobar que primero creara el recurso antes de destruir el cambio)
  key_name = data.aws_key_pair.vockey.key_name
  vpc_security_group_ids = [aws_security_group.sg_web_instance.id]
  user_data = file("user_data.sh")
  tags = {
    Name = "web_instance"
  }

  # lifecycle {
  #   create_before_destroy = true (permite que se cree el recurso antes de destruirlo para ejecutar el cambio de subred)
    #prevent_destroy = true (No destruye el recurso, se puede utilizar en recursos criticos.)
    #ignore_changes = [ami] ignota los cambios ejecutados en los parametros mencionados.
# }

provisioner "local-exec" {
  command = "echo instancia creada con IP ${aws_instance.web_instance.public_ip} >> datos_instence.txt"
}

provisioner "local-exec" {
  when = destroy
  command = "echo instancia con IP ${self.public_ip} Destruida >> datos_instence.txt"
}

# provisioner "remote-exec" {
#   inline = [
#   "echo 'hola mundo' > ~/saludo.txt"
#   ]
#   connection {
#     type = "ssh"
#     host = self.public_ip
#     user = "ec2-user"
#     private_key = file("labsuser.pem")
#   }

# }
}