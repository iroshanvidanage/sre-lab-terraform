resource "aws_iam_user" "payments-user" {
  # this way won't work cause iam username should be unique
  #   name = "payments-user"
  name  = "payments-user-${count.index}"
  count = 3
}

resource "aws_iam_user" "dev-user-id" {
  name  = var.dev-users[count.index]
  count = 3
}

resource "aws_iam_user" "dev-user-name" {
  name  = "dev-user-${var.dev-users[count.index]}"
  count = 3
}