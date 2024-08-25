# expose the public ip
output "eip-address" {
  value = aws_eip.sre-lab-eip.public_ip # exports the public ip
}

# can expose concatanated values
output "public-access-url" {
  value = "https://${aws_eip.sre-lab-eip.public_ip}:8080"
}

# can output all the attributes of the resource created
output "instance-details" {
  value = aws_instance.iroshanv-devops-srelab-ec2 # just specify the resource and resource name
}