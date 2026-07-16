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
  default     = "k8s-default-backendi-598781ecdc-983593658.us-east-1.elb.amazonaws.com"
}
# retrigger Thu Jul 16 11:20:28 UTC 2026
# retrigger Thu Jul 16 11:38:06 UTC 2026
