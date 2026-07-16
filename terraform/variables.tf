variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "alb_dns_name" {
  description = "ALB DNS name created by EKS ingress controller"
  type        = string
  default     = "placeholder.us-east-1.elb.amazonaws.com"
}
