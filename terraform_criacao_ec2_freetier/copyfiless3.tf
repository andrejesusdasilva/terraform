resource "aws_s3_bucket_object" "buckets3jesus" {
  key    = "install_apache.sh"
  bucket = "${aws_s3_bucket.buckets3jesus.id}"
  source = "install_apache.sh"
  etag   = "${md5(file("install_apache.sh"))}"
}