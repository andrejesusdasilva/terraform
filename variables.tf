variable "name" {
  description = "The name for the resource"
  default = "example"
}
variable "environment" {
  description = "The env of the app"
  default = "staging"
}

variable "nomebucket" {
  description = "Nome do Bucket S3 de homologação"
  default = "buckets3jesus"
}