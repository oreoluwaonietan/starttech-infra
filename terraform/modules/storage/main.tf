resource "aws_s3_bucket" "frontend" {
  bucket = "starttech-frontend-bucket-${var.account_id}"
  tags   = { Name = "starttech-frontend-bucket" }
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket                  = aws_s3_bucket.frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_ecr_repository" "backend" {
  name                 = "starttech-backend-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = { Name = "starttech-backend-api" }
}
