resource "aws_iam_user" "admin" {
  name = local.admin_user_name
}

resource "aws_iam_user_policy" "admin_policy" {
  name   = "${local.admin_user_name}-policy"
  policy = data.aws_iam_policy_document.admin_policy.json
  user   = aws_iam_user.admin.name
}