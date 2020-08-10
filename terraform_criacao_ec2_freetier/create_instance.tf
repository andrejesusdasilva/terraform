resource "aws_instance" "example" {
  ami           = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = "${var.instance_type}"
  count = 1
  key_name = "${aws_key_pair.key-pair.key_name}"
  security_groups = ["${aws_security_group.security_group_aws_andrej.id}"]
  subnet_id = "${aws_subnet.subnet.id}"
  #user_data = "${file("install_apache.sh")}"
  #https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
  #teste integração atlantis
  depends_on = ["aws_internet_gateway.gwfreetier"]
    
  tags = {
	Name = "andrejesusinstance"
  }
  
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = "true"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    host = "${self.public_ip}"
    private_key = "${tls_private_key.key-pair.private_key_pem}"
  } 
  
  #copying archive into the instance ec2
  #precisa ter permissão na ec2 para enviar os arquivos
  #provisioner "file" {
  # source      = "install_apache.sh"
  # destination = "/home/ubuntu/install_apache.sh"
  #}
  
 #installing java using provisioner
 #provisioner "remote-exec" {
 #   inline = [
 #	  "sudo apt-get update",
 #	  "sudo apt-get install -y openjdk-8-jre-headless"
 #	]
 # }
  
 #desabilitando para deixar como exemplo
 #muitas vezes ao provisionar da erro para baixar algumas dependencias
 #installing apache2 using provisioner
 #provisioner "remote-exec" {
 #   inline = [
 #	  "sudo apt-get update",
 #	  "sudo apt-get install -y apache2",
 #	  "sudo systemctl start apache2",
 #	  "sudo systemctl enable apache2",
 #	  "echo \"<h1>Deploy executado com o Terraform</h1>\" | sudo tee /var/www/html/index.html"
 #   ]
 # }
} 
