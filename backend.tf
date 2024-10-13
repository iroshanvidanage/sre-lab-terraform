# # Terraform s3 backend config
# terraform {
#   backend "s3" {
#     bucket = "mybucket"
#     key    = "path/to/my/key"
#     region = "us-east-1"
#   }
# }


# # local backend config (this cannot be set dynamically)
# terraform {
#   backend "local" {
#     path = "relative/path/to/terraform.tfstate"
#   }
# }

# # local backend config (used to set backend dynamically)
# data "terraform_remote_state" "foo" {
#   backend = "local"

#   config = {
#     path = "${path.module}/../../${terraform_file_name}.tfstate"
#   }
# }
