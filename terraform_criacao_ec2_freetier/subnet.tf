resource "aws_subnet" "subnet" {
  vpc_id     = "${aws_vpc.vpc_name_freetier.id}"
  cidr_block = "10.0.1.0/24" #libera 254 ips nesta subnet
  map_public_ip_on_launch = "true" # essa opção torna a subnet publica
  #essa opção habilitou no console da aws a geração do dns que é utilizado para conectar
  #na instancia
  #availability_zone = "${aws_instance.example.availability_zone}"
  tags = {
    Name = "subnetfreetier"
  }
}