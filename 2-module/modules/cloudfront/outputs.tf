output "cdn_hosted_zone_id" {
  value = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
}

output "cf_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}