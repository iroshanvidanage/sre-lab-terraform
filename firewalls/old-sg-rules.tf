resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "managed security group from terraform"
  # if the vpc wasn't defined it will be created in the default vpc in the region

  tags = {
    Name = "terraform-sg"
  }

  # inbound rules
  ingress {
    description = "allow-ssh"
    protocol    = "tcp"
    cidr_blocks = ["172.20.192.0/24"]
    from_port   = 22 # This is to determine the Port Range
    to_port     = 22
  }

  ingress {
    description = "allow-https"
    protocol    = "tcp"
    cidr_blocks = ["172.20.192.0/24"]
    from_port   = 443
    to_port     = 443
  }

  # outbound rules
  egress {
    description = "allow_any"
    protocol    = "-1" # semantically equivalent to all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

}






