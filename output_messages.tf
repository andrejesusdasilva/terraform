output "instance_ip_addr" {
  value = "${tls_private_key.key-pair.private_key_pem}"
}

