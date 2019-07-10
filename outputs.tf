output "website_endpoint" {
  description = "The endpoint of the created S3 bucket"
  value       = aws_s3_bucket.yum_repo.website_endpoint
}

