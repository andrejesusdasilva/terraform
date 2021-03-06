provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region     = "${var.region}"
  profile = "${var.profile}"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true
  s3_force_path_style = true  
}

