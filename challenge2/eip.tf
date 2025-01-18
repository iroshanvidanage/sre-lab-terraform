resource "aws_eip" "example" {
  domain = "vpc"

  tags = merge(local.common_tags,
    tomap(
      { "Category" = "Public" }
    )
  )
}

