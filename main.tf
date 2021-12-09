provider "aws" {
    region     = "us-east-1"
  }
  
  resource "aws_instance" "ubuntu" {
    ami           = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "PEM"
  }
  
  resource "aws_eip" "elastic_ip" {
    instance = aws_instance.ubuntu.id
  }
  
  
#   resource "aws_security_group" "ss1" {
#   name = "allow_ssh_cnn"
  
#   ingress {
#       description = "ssh from VPC"
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#       description = "http"
#       from_port = 80
#       to_port = 80
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#       }
#   ingress {
#       description = "https"
#       from_port = 443
#       to_port = 443
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#       }
#   }
  
  output "EIP" {
    value = aws_eip.elastic_ip.public_ip
  }
  
