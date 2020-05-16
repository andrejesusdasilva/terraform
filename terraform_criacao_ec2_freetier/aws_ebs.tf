#Criar o volume (expandi o disco da ec2)
#você pode consultar o novo disco usando o comando fdisk
resource "aws_ebs_volume" "aws_ebs_vol_freetier" {
  availability_zone = "${aws_instance.example.availability_zone}"
  size              = 7

  tags = {
    Name = "ebsinstance"
  }
}

#atachar o volume na instancia
resource "aws_volume_attachment" "ebs_att_freetier" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.aws_ebs_vol_freetier.id}"
  instance_id = "${aws_instance.example.id}"
}