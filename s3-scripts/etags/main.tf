terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}


resource "aws_s3_object" "default" {
 
 bucket = "sinxlpost-is-sexy"
 key ="text.txt"
 source ="text.txt"
 etag = filemd5 ("text.txt")
}




