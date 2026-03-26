terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.32.0"
    }
  }


  backend "s3" {
    bucket = "rachel-remote-tfstate"
    key    = "remote-state-demo"
    region = "us-east-1"
    # dynamodb_table = "rachel-remote-tfstate" 
    encrypt        = true # Encrypt the state file at rest in S3 using server-side encryption (SSE). Protected from unauthorized access.
    use_lockfile = true # Enable state locking to prevent concurrent modifications.
  }
}

provider "aws" {
  # Configuration options
}