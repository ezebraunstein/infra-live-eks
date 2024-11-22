variable "bucket_name" {
  description = "Name of the S3 bucket for the Terraform backend"
  type        = string
}

variable "table_name" {
  description = "Name of the DynamoDB table for Terraform backend locking"
  type        = string
}

variable "tags" {
  description = "Tags to apply to shared resources"
  type        = map(string)
  default = {
    Environment = "shared"
    Project     = "Terraform Backend"
  }
}
