terraform {
  backend "s3" {
    bucket = "terraform-cert-s3-backend"
    key    = "state/terraform.tfstate"
    region = "ap-south-1"
  }
}