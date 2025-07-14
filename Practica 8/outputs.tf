output "ec2_public_ip" {
  value       = aws_instance.web_instance.public_ip
  description = "IP Publica de la instancia"
}
