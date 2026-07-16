output "vpc_id" {
  value = module.networking.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "ecr_repository_url" {
  value = module.storage.ecr_repository_url
}

output "cloudfront_domain" {
  value = module.cdn.cloudfront_domain
}

output "cloudfront_distribution_id" {
  value = module.cdn.distribution_id
}

output "redis_endpoint" {
  value = module.database.redis_endpoint
}
