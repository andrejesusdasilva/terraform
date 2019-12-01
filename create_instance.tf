resource "aws_instance" "example" {
  ami           = "ami-4dd2575b"
  instance_type = "t2.micro"
  count = 1
  key_name = "aws_local"
  security_groups = ["${aws_security_group.security_group_aws_andrej.name}"]
  #user_data = "${file("install_apache.sh")}"
  tags = {
	Name = "andrejesusinstance"
  }
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    host = "${self.public_ip}"
	private_key = "${file("aws_local.pem")}"
  } 
  
  #copying archive into the instance ec2
  provisioner "file" {
   source      = "localstack_boto3_tests.py"
   destination = "/home/ubuntu/localstack_boto3_tests.py"
 
 }
  
 #installing java using provisioner
 provisioner "remote-exec" {
    inline = [
	  "sudo apt-get update",
	  "sudo apt-get install -y openjdk-8-jre-headless"
	]
  }
  
 #installing apache2 using provisioner
 provisioner "remote-exec" {
    inline = [
	  "sudo apt-get update",
	  "sudo apt-get install -y apache2",
	  "sudo systemctl start apache2",
	  "sudo systemctl enable apache2",
	  "echo \"<h1>Deploy executado com o Terraform</h1>\" | sudo tee /var/www/html/index.html"
    ]
  }
} 