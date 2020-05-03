resource "aws_internet_gateway" "gwfreetier" {
  vpc_id = "${aws_vpc.vpc_name_freetier.id}"

  tags = {
    Name = "aws_internet_gateway_freetier"
  }
}

resource "aws_route_table" "routefreetier" {
  vpc_id = "${aws_vpc.vpc_name_freetier.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gwfreetier.id}"
  }

  tags = {
    Name = "main"
  }
}

#associa a rota na subnet
resource "aws_route_table_association" "aws_route_table_association_freetier"{
    subnet_id = "${aws_subnet.subnet.id}"
    route_table_id = "${aws_route_table.routefreetier.id}"
}