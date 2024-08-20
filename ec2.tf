# author    https://github.com/iroshanvidanage
# date      08/20/2024

resource "aws_instance" "iroshanv-devops-srelab-ec2" {
  ami           = var.ami                    #ami used to create the ec2
  instance_type = var.instance_properties[1] #ec2_instance_type

  tags = {
    Name        = "srelab-ec2"
    Environment = "Dev" #can_be_uat_qa_prod
  }
}

resource "aws_eip" "iroshanv-devops-srelab-ec2" {
  instance = aws_instance.iroshanv-devops-srelab-ec2.id

}