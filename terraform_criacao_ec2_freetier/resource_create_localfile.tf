resource "local_file" "privatekey" {
    content     = "${tls_private_key.key-pair.private_key_pem}"
    filename = "privatekey.pem"
}