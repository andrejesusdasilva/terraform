provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region     = "us-east-1"
  profile = "freetier"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true
  s3_force_path_style = true  
}

