# author    https://github.com/iroshanvidanage
# date      08/25/2024

# allocate eip
resource "aws_eip" "sre-lab-eip" {
  # instance = aws_instance.iroshanv-devops-srelab-ec2.id # directly associate with the instance
  domain = "vpc"
}

# associate eip with instance
resource "aws_eip_association" "sre-lab-eip-associate" {
  instance_id   = aws_instance.iroshanv-devops-srelab-ec2.id
  allocation_id = aws_eip.iroshanv-devops-srelab-ec2.id
}