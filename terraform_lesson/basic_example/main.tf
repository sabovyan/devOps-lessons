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

resource "aws_instance" "basic_example" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"

}
