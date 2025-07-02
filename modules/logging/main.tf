resource "aws_s3_bucket" "logs" {
  bucket = "poc-prod-logs-bucket"
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
  iam_role_arn         = aws_iam_role.vpc_flow_logs.arn
}

resource "aws_flow_log" "s3" {
  log_destination = aws_s3_bucket.logs.arn
  log_destination_type = "s3" 
  traffic_type = "ALL"
  vpc_id = var.vpc_id
}
