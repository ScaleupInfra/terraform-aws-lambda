# Output the url
output "public_endpoint" {
  value = aws_lambda_function_url.test_url.function_url
}