provider "vault" {}

data "vault_kv_secret_v2" "aws_creds" {
  mount = "aws"
  name  = "creds"
}

provider "aws" {
  region     = data.vault_kv_secret_v2.aws_creds.data["region"]
  access_key = data.vault_kv_secret_v2.aws_creds.data["access_key"]
  secret_key = data.vault_kv_secret_v2.aws_creds.data["secret_key"]
}

resource "aws_instance" "demo" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name = "Repo-Triggered-Instance"
  }
}
