data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "lock-state-bucket-vpc-craftech" 
    key    = "dev/terraform.tfstate"          
    region = "us-east-1"                      
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "lock-state-bucket-eks-craftech" 
    key    = "dev/terraform.tfstate"          
    region = "us-east-1"                      
  }
}


module "eks" {
  source        = "git::https://github.com/ezebraunstein/modules-repo.git//modules/eks"
  cluster_name  = var.cluster_name
  subnet_ids   = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  node_role_arn = data.terraform_remote_state.eks.outputs.node_role_arn

  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size

  instance_types = var.instance_types

  tags = {
    Environment = "dev"
    Project     = "EKS"
  }
}


