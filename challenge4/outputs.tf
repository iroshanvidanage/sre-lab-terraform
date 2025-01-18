output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "all_admin_users" {
  value = data.aws_iam_users.all_admin_users.names
}

output "total_users" {
    value = length(data.aws_iam_users.all_admin_users.names)
}