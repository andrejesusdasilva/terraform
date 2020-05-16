resource "aws_s3_bucket" "buckets3jesus" {
  bucket = "${var.nomebucket}"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}