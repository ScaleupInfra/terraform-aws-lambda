module "lambda" {
  source = "./terraform_aws_lambda"
  # Giving Default Values, you can change it as per your needs
  /* lambda_function_name = ["infrasity_terraform_lambda_function"] # list
  handler_name         = "python.lambda_handler"                 # string
  runtime              = "python3.10"                            # string
  authorization        = "NONE"                                  # string
  iam_role_name        = "iam_for_lambda_tf"                     # string */
}