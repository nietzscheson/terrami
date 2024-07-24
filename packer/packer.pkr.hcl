packer {
  required_plugins {
    amazon = {
      version = "~> 1"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }

  }
}

variable "region" {
  type    = string
  default = "us-east-2"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "default" {
  ami_name      = "az2-base-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.default"]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }
}