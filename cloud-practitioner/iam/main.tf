resource "aws_iam_user" "my-own-user" {
  name = "Bogdan-Terraform"
  tags = {
    Description = "Was Created via Terraform"
  }
}