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

# 🔥 Automatically fetch latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "Repo-Triggered-Instance"
  }
}
