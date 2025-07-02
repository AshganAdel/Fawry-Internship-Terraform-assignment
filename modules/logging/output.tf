output "cloudwatch_log_group_arn" {
  description = "ARN of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.vpc.arn
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket for VPC Flow Logs (prod only)"
  value       = aws_s3_bucket.logs.arn
}
