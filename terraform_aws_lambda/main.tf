# Ziping the python files
data "archive_file" "python_zip" {
  type        = "zip"
  source_dir  = "${path.module}/python_files"
  output_path = "${path.module}/zip/python_files.zip"
}

# Creating a lambda function with code from Zip files, and giving [REQUIRED] role to it
resource "aws_lambda_function" "test_lambda" {
  /* count = length(var.lambda_function_name) */
  filename         = "${path.module}/zip/python_files.zip"
  function_name    = var.lambda_function_name.lambda
  role             = aws_iam_role.iam_for_lambda_tf.arn
  handler          = var.handler_name.handle # this is required since package type is a zip
  source_code_hash = data.archive_file.python_zip.output_base64sha256
  runtime          = var.runtime.version
}

# Making URL public to invoke
resource "aws_lambda_function_url" "test_url" {
  function_name      = aws_lambda_function.test_lambda.function_name
  authorization_type = var.authorization.auth_type
}

# Creating a role for Lambda Function
resource "aws_iam_role" "iam_for_lambda_tf" {
  name               = var.iam_role.role
  assume_role_policy = file("${path.module}/roles/creation_role.json")
}
