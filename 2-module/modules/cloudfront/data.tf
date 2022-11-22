data "aws_acm_certificate" "acm_website" {
  domain      = "*.iansoares.tk"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
