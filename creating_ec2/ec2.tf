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
  }                     # tags are map data type
}

resource "aws_instance" "secondary-instance" {
  ami           = module.variables.ami
  instance_type = module.variables.instance_types_regions_list[1]
}

resource "aws_instance" "third-instance" {
  ami           = module.variables.ami
  instance_type = module.variables.instance_types_regions_map["us-east-1"]
  count         = 5 # will create 5 identtical resources

  # this will only assign the same name to resources
  /*
  tags = {
    Name = "payments-system"
  }*/

  tags = {
    Name = "payments-system-${count.index}"
  }
}