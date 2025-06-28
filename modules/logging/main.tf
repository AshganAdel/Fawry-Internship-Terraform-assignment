resource "aws_s3_bucket" "logs" {
  bucket = "poc-prod-logs-bucket"
  acl = "private"
  force_destroy = true
}
resource "aws_cloudwatch_log_group" "vpc" {
  name = "poc-prod-logs"
}
resource "aws_flow_log" "vpc" {
  log_destination      = aws_cloudwatch_log_group.vpc.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
  iam_role_arn         = var.flow_log_role_arn
}