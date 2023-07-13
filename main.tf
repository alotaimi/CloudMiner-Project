terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}


resource "aws_security_group" "minecraft_server_security_group" {
name = "minecraft_server_security_group"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 25565
    to_port = 25565
    protocol = "tcp"
  }

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}


resource "aws_instance" "minecraft_server" {
  ami = "ami-053b0d53c279acc90"

  instance_type = "t2.medium"
  key_name = "private_key"
  vpc_security_group_ids = [aws_security_group.minecraft_server_security_group.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt install -y openjdk-17-jre-headless
  cd /home/ubuntu
  mkdir minecraft
  cd minecraft
  wget -O minecraft_server.jar https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar
  sudo systemctl enable cron
  sudo systemctl start cron
  echo '@reboot cd /home/ubuntu/minecraft && /usr/bin/java -Xmx1024M -Xmx1024M -jar minecraft_server.jar nogui' | crontab
  echo "eula=true" > eula.txt
  /usr/bin/java -Xmx2G -jar minecraft_server.jar nogui
  EOF



  tags = {
    Name = "minecraft_server"
  }
}
