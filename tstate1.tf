# main.tf

terraform {
  backend "remote" {
    organization = "wizards1234"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
  access_key = "AKIAXZBBQGOXUZYBEJLT"
  secret_key = "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"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name22
  }
}

# variables.tf

variable "instance_name22" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}