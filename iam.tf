resource "aws_iam_user" "payments-user" {
  # this way won't work cause iam username should be unique
  #   name = "payments-user"
  name  = "payments-user-${count.index}"
  count = 3
}

resource "aws_iam_user" "dev-user-id" {
  name  = var.dev-users[count.index]
  count = length(var.dev-users)
}

resource "aws_iam_user" "dev-user-name" {
  name  = "dev-user-${var.dev-users[count.index]}"
  count = length(var.dev-users)
}

resource "aws_iam_user_policy" "dev-user" {
  count = length(var.dev-users)
  name  = "dev-user-policy"
  user  = element(var.dev-users, count.index)
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "*",
        "Effect" : "Denied",
        "Resource" : "*"
      },
      {
        "Action" : "*",
        "Effect" : "Allow",
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "iam:role-name" : [
              "Role-name-aws"
            ]
          }
        }
      }
    ]
  })
}

# file function can be used to pass data stored in files as input variables.
resource "aws_iam_user_policy" "dev-user-2" {
  count  = length(var.dev-users)
  name   = "dev-user-policy-2"
  user   = "dev-user-${element(var.dev-users, count.index)}"
  policy = file("./files/ec2-policy.json")
}