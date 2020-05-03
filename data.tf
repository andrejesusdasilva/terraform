data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
	}
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}