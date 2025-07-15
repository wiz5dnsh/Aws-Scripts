resource "aws_s3_bucket" "SInxlpost-Bucket" {
  bucket = "my-tf-test-bucket-sinxlpost"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
