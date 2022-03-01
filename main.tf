provider "aws" {
  region = var.region
}

terraform {
  cloud {
    organization = "fcamba-org"

    workspaces {
      name = "aws-sentinel-playground"
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami                    = data.aws_ami.ubuntu.id
  //instance_type          = var.instance_type
  //instance_type = "t2.2xlarge"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
    department = "Dev"
    Billable = true
  }
}
