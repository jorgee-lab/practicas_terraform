#!/bin/bash
echo "Este es un mensaje" > /home/ec2-user/mensaje.txt
yum update -y
yum install httpd
systemctl start httpd
systemctl enable httpd