data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "lock-state-bucket-vpc-craftech" 
    key    = "dev/terraform.tfstate"          
    region = "us-east-1"                      
  }
}

data "terraform_remote_state" "roles" {
  backend = "s3"

  config = {
    bucket = "lock-state-bucket-eks-craftech" 
    key    = "roles/terraform.tfstate"          
    region = "us-east-1"                      
  }
}


module "eks" {
  source        = "git::https://github.com/ezebraunstein/terraform-modules.git//modules/eks"
  AWS_REGION  = var.AWS_REGION
  cluster_name  = var.cluster_name
  subnet_ids   = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  node_role_arn = data.terraform_remote_state.roles.outputs.node_role_arn
  cluster_role_arn = data.terraform_remote_state.roles.outputs.cluster_role_arn

  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size

  instance_types = var.instance_types

  tags = {
    Environment = "dev"
    Project     = "EKS"
  }
}


