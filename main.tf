/* Multi line coments can be done as this way
easy to undersatand */

#configuration objects
provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "iroshanv-devops-srelab-ec2" {
    ami = "ami-020916b60b78f7108"#ami used to create the ec2
    instance_type = "c6g.medium" #ec2_instance_type

    tags = {
        Name = "srelab-ec2"
        Environment = "Dev" #can_be_uat_qa_prod
    }
}
