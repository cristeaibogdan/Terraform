// This generates a JSON policy document that allows a principal to assume a role
data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"] // The action allowed: assume the role via AWS STS
    principals {
      type        = "Service" // The type of principal that can assume this role
      identifiers = ["lambda.amazonaws.com"] // Only AWS Lambda service can assume it
    }
  }
}

// This creates the IAM role that your Lambda function will use
resource "aws_iam_role" "lambda_execution_role" {
  name               = "lambda_execution_role" // Name of the IAM role
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json // The trust policy (from above) that allows Lambda to assume this role  
}

// This creates the Lambda function in AWS
resource "aws_lambda_function" "hello_world" {
  function_name = "hello-world-lambda" // Name of the Lambda function in AWS
  role          = aws_iam_role.lambda_execution_role.arn // The IAM role ARN that Lambda assumes when it runs

  runtime       = "nodejs20.x" // The runtime environment (Node.js version)
  handler       = "app.lambdaHandler" // Entry point: <file>.<exported_function> from the zip

  filename         = "hello-world.zip" // Path to the zip file containing Lambda code
  source_code_hash = filebase64sha256("hello-world.zip") // Hash of the zip; Terraform uses this to detect code changes and trigger redeploys
}