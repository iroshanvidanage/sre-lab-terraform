# data blocks for iam
data "aws_iam_user" "user-iroshan" {
  user_name = "user-iroshan"
}

# data blocks for vpc
data "aws_vpc" "default" {
  default = true
}

# read data from a local file
data "local_file" "test" {
  filename = "${path.module}/files/test.txt"
}

# data sources for ami
data "aws_ami" "amazon_linux_latest" {
  most_recent = true # will retrieve the latest version
  filter {
    name   = "name"
    values = ["Amazon Linux 2023*"]
  }
}