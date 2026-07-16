terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "starttech-tfstate-067514125712"
    key            = "starttech-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "starttech-tfstate-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "eks" {
  source             = "./modules/eks"
  private_subnet_ids = module.networking.private_subnet_ids
  vpc_id             = module.networking.vpc_id
}

module "storage" {
  source     = "./modules/storage"
  account_id = data.aws_caller_identity.current.account_id
}

module "cdn" {
  source                 = "./modules/cdn"
  bucket_name            = module.storage.bucket_name
  bucket_arn             = module.storage.bucket_arn
  bucket_regional_domain = module.storage.bucket_regional_domain
  alb_dns_name           = var.alb_dns_name
}

module "database" {
  source                = "./modules/database"
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  eks_security_group_id = module.eks.cluster_security_group_id
}
