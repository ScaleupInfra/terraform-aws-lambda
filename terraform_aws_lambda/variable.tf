variable "lambda_function_name" {
  default = {
    lambda = "terraform_lambda"
  }
}

variable "handler_name" {
  default = {
    handle = "python.lambda_handler"
  }
}

variable "runtime" {
  default = {
    version = "python3.10"
  }
}

variable "authorization" {
  default = {
    auth_type = "NONE"
  }
}

variable "iam_role" {
  default = {
    role = "iam_for_lambda_tf"
  }
}