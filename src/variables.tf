variable "access_key" {
    type         = string
    description  = "AWS Accesss Key"
    sensitive   = true
}
variable "secret_key" {
    type         = string
    description  = "AWS Secret Key"
    sensitive   = true
}
variable "region" {
    type         = string
    description  = "AWS Region"
    default = "us-east-1"
}

variable "listeners" {
  description = "A list of listener configurations with protocol, port, and SSL certificate ARN"
  type = list(object({
    protocol       = string
    port           = number
    ssl_cert_data  = optional(string)
  }))
  default = [
    {
      protocol    = "HTTP"
      port        = 80
      # ssl_cert_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-abcd-1234-abcd-123456789012"
    },
    {
      protocol    = "HTTP"
      port        = 8081
      # ssl_cert_arn = "arn:aws:acm:us-east-1:123456789012:certificate/efgh5678-efgh-5678-efgh-567890123456"
    }
  ]
}
