resource "aws_s3_bucket" "finance" {
  bucket = "finance-17032026"
  tags = {
    Description = "Finance and Payroll"
  }
}

resource "aws_s3_object" "finance-2026" {
  content = "/root/finance/finance-2026.doc"
  key = "finance-2026.doc"
  bucket = aws_s3_bucket.finance.id
}