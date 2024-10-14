# Terraform s3 backend config
terraform {
  backend "s3" {
    bucket         = "terraform-state-file"
    key            = "terraform-state-folder/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}


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
