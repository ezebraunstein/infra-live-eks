variable "AWS_REGION" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Cluster for the environment"
  type        = string
}

variable "desired_size" {
  description = "Desired size of the EKS node group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the EKS node group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the EKS node group"
  type        = number
}

variable "instance_types" {
  description = "List of instance types for the EKS Node Group"
  type        = list(string)
  default     = ["t3.medium"] 
}

