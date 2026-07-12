variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
