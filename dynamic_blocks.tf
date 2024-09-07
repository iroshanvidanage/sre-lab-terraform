# here the the resources are used as the firewalls/old-sg-rules.tf
# without dynamic block

resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "managed security group from terraform"

  tags = {
    Name = "terraform-sg"
  }

  # inbound rules
  ingress {
    description = "allow-ssh"
    protocol    = "tcp"
    cidr_blocks = ["172.20.192.0/24"]
    from_port   = 22
    to_port     = 22
  }

  ingress {
    description = "allow-https"
    protocol    = "tcp"
    cidr_blocks = ["172.20.192.0/24"]
    from_port   = 443
    to_port     = 443
  }

  ingress {
    description = "allow-app"
    protocol    = "tcp"
    cidr_blocks = ["172.20.192.0/24"]
    from_port   = 8080
    to_port     = 8080
  }

  ingress {
    description = "allow-secret-app"
    protocol    = "tcp"
    cidr_blocks = ["172.20.192.0/24"]
    from_port   = 8443
    to_port     = 8443
  }

  # outbound rules
  egress {
    description = "allow_any"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}





# With dynamic block

variable "sg_ports_vpc" {
  type        = list(number)
  description = "list of ports to be open within vpc"
  default     = [22, 443, 8080, 8443]
}


resource "aws_security_group" "rules_within_vpc" {
  name        = "terraform-sg"
  description = "managed security group from terraform"

  tags = {
    Name = "terraform-sg"
  }

  # inbound rules
  dynamic "ingress" {
    for_each = var.sg_ports_vpc
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["172.20.192.0/24"]
    }
  }

  # outbound rules
  egress {
    description = "allow_any"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


