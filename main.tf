provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my-first-ec2" {
    ami = "ami-ami_id_should_be_here"
    instance_type = "t2.micro" #ec2_instance_type

    tags = {
        Name = "first-instance"
        Environment = "Dev" #can_be_uat_qa_prod
    }
}
