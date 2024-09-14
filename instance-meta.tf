#  the lifecycle meta argument can ignore the manula changes done to a particular resource

resource "aws_instance" "iroshanv-devops-srelab-ec2" {
  ami           = var.ami                    #ami used to create the ec2
  instance_type = var.instance_properties[1] #ec2_instance_type

  tags = {
    Name        = "srelab-ec2"
    Environment = "Dev" #can_be_uat_qa_prod
  }                     # tags are map data type

  lifecycle {
    ignore_changes        = [tags, instance_type] # from this the tags & instance_type will be ignored if had changed
    create_before_destroy = true                  # creates the new instance before destroying the previous ec2
  }
}
