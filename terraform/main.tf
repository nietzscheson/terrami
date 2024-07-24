provider "aws" {
  default_tags {
    tags = {
      Name        = local.name
      Environment = local.environment
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terrami-infra"
    key    = "state.tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

data "aws_ami" "az2_base" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["az2-base-*"]
  }
}