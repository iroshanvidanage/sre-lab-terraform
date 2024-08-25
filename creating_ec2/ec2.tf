# author    https://github.com/iroshanvidanage
# date      08/20/2024

module "variables" {
  # using the module to import the variable outputs
  source = "../"
}
resource "aws_instance" "iroshanv-devops-srelab-ec2" {
  ami           = module.variables.ami                 #ami used to create the ec2
  instance_type = module.variables.instance_properties #ec2_instance_type

  tags = {
    Name        = "srelab-ec2"
    Environment = "Dev" #can_be_uat_qa_prod
  }
}
