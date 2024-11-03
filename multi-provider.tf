provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

# idealy prod sg should be deployed in singapore
resource "aws_security_group" "allow_tls_prod" {
  provider = aws.singapore
  name     = "fwr_prod"
}

# uat sg should be in mumbai
resource "aws_security_group" "allow_tls_uat" {
  provider = aws.mumbai
  name     = "fwr_uat"
}