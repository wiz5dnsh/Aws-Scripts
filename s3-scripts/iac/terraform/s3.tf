resource "aws_s3_bucket" "sinxlpost-one1"{
  bucket = "my-tf-test-bucket-sinxlpost"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
