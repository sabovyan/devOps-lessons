terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}


data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

}

resource "aws_instance" "my_instance_1" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

}

resource "aws_instance" "my_instance_2" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

}
