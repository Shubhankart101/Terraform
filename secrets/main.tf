provider "aws" {
  region = "ap-south-1"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

provider "vault" {
  auth_login {
    path = auth / userpass / login / username
    parameters = {
      password = var.password
    }
  }
}

# data "vault_generic_secret" "authtoken" {
#   path = "secret/authtoken"
# }


data "vault_generic_secret" "dbuser" {
  path = "secret/dbuser"
}

data "vault_generic_secret" "dbpassword" {
  path = "secret/dbpass"
}

# secret/dbuser{
#     value = bob
# }

# secret/dbpass{
#     value = password123
# }

resource "aws_db_instance" "myRDS" {
  db_name        = "myDB"
  identifier     = "my-first-rds"
  instance_class = "db.t2.micro"
  engine         = "mariadb"
  engine_version = "10.2.21"
  username       = data.dbuser.data["value"]
  password       = data.dbpassword.data["value"]
  #username            = "bob"
  #password            = "password123"
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}

# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"
# }