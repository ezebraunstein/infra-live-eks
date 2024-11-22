output "cluster_role_arn" {
  description = "ARN of the EKS cluster role"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "node_role_arn" {
  description = "ARN of the EKS node role"
  value       = aws_iam_role.eks_node_role.arn
}
