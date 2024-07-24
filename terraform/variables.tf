# core

locals {
  name        = "terrami-${terraform.workspace}"
  environment = terraform.workspace
}

data "aws_caller_identity" "current" {}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-2"
}