variable "aws_region" {
  description = "AWS Region for deployed resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_id" {
  type        = string
  default     = "desafio-ian-sust"
  description = "The global unique id for the bucket"
}

variable "upload_directory" {
  type    = string
  default = "./src/"
}

variable "mime_types" {
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    md   = "text/markdown"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
    png  = "image/x-png"
    svg  = "image/svg+xml"
    jpg  = "image/jpeg"
  }
}

variable "site_domain" {
  description = "Site domain for Route 53 Hosted Zone"
  type        = string
  default     = "serverless.iansoares.tk"
}

variable "aliases_cf" {
  description = "Aliases CloudFront - Alternative domain names"
  type        = list(any)
  default     = ["iansoares.tk", "www.iansoares.tk", "serverless.iansoares.tk"]
}