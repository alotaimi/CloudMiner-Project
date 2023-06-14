output "The_Public_IP_address_of_the_Minecraft_Server" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.minecraft_server.public_ip
}