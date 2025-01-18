locals {
  admin_user_name = "${var.admin_user_name_prefix}-${data.aws_caller_identity.current.account_id}"
}