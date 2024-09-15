# creating resource for provisioner

resource "aws_instance" "iroshanv-devops-srelab-ec3" {
  ami           = var.ami                    #ami used to create the ec2
  instance_type = var.instance_properties[1] #ec2_instance_type
  key_name      = "sample-key"

  tags = {
    Name        = "srelab-ec2"
    Environment = "Dev" #can_be_uat_qa_prod
  }                     # tags are map data type

  # local-exec
  # print a simple statement
  # creation-time no need to specify when
  provisioner "local-exec" {
    command    = "echo Server has been created."
    on_failure = continue
  }

  provisioner "local-exec" {
    interpreter = ["/bin/sh", "-c"]
    command     = "echo ${self.private_ip} > server_ip.txt"
  }

  # destroy-time
  provisioner "local-exec" {
    when    = destroy # to specify destroy-time
    command = "echo Server been destroyed."
  }

  # inorder to connect to the server need to specify the connection details
  connection {
    type        = "ssh"      # for linux and winrm for windows
    user        = "ec2-user" # for windows it should be Administrator
    private_key = file("./sample-key.pem")
    host        = self.public_ip
  }

  # the commands required to run on the remote server
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}
