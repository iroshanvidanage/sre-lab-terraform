# using as a module to get the eip details
module "eip" {
  source = "../creating_ec2"
}

module "main" {
  source = "../"
}

resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "managed security group from terraform"
  # if the vpc wasn't defined it will be created in the default vpc in the region

  tags = {
    Name = "terraform-sg"
  }
}

# inbound rules
resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  # defines the security-group id of the target resource we want to add the rule
  security_group_id = aws_security_group.terraform-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "172.20.192.0/24"
  from_port         = 22 # This is to determine the Port Range
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow-https" {
  security_group_id = aws_security_group.terraform-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "172.20.192.0/24"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow-ftp-data" {
  security_group_id = aws_security_group.terraform-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "172.20.192.0/24"
  from_port         = 7000 # starting port
  to_port           = 7010 # ending port
}

resource "aws_vpc_security_group_ingress_rule" "allow-eip" {
  security_group_id = aws_security_group.terraform-sg.id
  ip_protocol       = "tcp"
  /* in sg-rules need to specify the cidr mask(block/the mask) to the ip
  first need to compute the value
  then add the mask to the computed value
  for this need string interpolation
  */
  cidr_ipv4 = "${module.eip.eip-address}/32" # string interpolation
  /* the eip of the created resource has been used here
  */
  from_port = 7000 # starting port
  to_port   = 7010 # ending port
}

resource "aws_vpc_security_group_ingress_rule" "allow-app-traffic" {
  security_group_id = aws_security_group.terraform-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = module.main.public-subnet-1
  from_port         = module.main.app-port
  to_port           = module.main.app-port
}

# outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_any" {
  security_group_id = aws_security_group.terraform-sg.id
  ip_protocol       = "-1" # semantically equivalent to all traffic
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "-1"
  to_port           = "-1"
}

