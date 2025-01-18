data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "admin_policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

# fetch IAM users created

data "aws_iam_users" "all_admin_users" {}