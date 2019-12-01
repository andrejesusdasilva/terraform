provider "aws" {
  access_key = "anaccesskey"
  secret_key = "asecretkey"
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true 
  endpoints {
    ec2 = "http://192.168.99.101:4597"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-4dd2575b"
  instance_type = "t2.micro"
}