resource "aws_security_group" "security_group_aws_andrej" {
  name = "aws_andrej"
  description = "Web Security Group"
  #vpc_id = "vpc-72084e08" 
  vpc_id = "${aws_vpc.vpc_name_freetier.id}"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}