terraform {
  backend "s3" {
    bucket         = "lock-state-bucket-eks-craftech"
    key            = "roles/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-eks"
  }
}
