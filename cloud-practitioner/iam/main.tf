resource "aws_iam_user" "my-own-user" {
  name = "Bogdan-Terraform"
  tags = {
    Description = "Was Created via Terraform"
  }
}

resource "aws_iam_group" "my-own-group" {
  name = "Terraform_Created_Group"
}

resource "aws_iam_user_group_membership" "assign-group-to-user" {
  user   = aws_iam_user.my-own-user.name
  groups = [aws_iam_group.my-own-group.name]
}