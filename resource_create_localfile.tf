resource "local_file" "privatekey" {
    count = "${var.create_privatekey_local == 0 ? 0 : 1}"
    content     = "${tls_private_key.key-pair.private_key_pem}"
    filename = "privatekey.pem"
}