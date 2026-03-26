terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.32.0"
    }
  }
}

provider "aws" {
  # Configuration options
  alias = "prod"
  profile = "prod"
}

provider "aws" {
  # Configuration options
  alias = "dev"
  profile = "dev"
}