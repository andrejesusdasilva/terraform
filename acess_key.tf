
#é possível você gerar o par de chaves que será utilizado para acessar/comunicar com
#a instancia
#a saída da chave vai ser disponibilizada via output do terraform
resource "tls_private_key" "key-pair" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key-pair" {
  key_name = "aws_local_1"

  public_key = "${tls_private_key.key-pair.public_key_openssh}"
}
