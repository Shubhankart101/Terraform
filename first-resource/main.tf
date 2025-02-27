provider "aws" {
  region = "ap-south-1"
#  access_key = "AKIA6NIDPEZSHQZDAJJ4"
#  secret_key = "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"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16" 
}