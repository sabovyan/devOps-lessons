provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "vpc_stage" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "staging"
  }
}


resource "aws_internet_gateway" "test_gateway" {
  vpc_id = aws_vpc.vpc_stage.id
}


resource "aws_route_table" "test_route" {
  vpc_id = aws_vpc.vpc_stage.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.test_gateway.id
  }


  tags = {
    Name = "test_route"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_route.id
}

resource "aws_subnet" "test_subnet" {
  vpc_id            = aws_vpc.vpc_stage.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Main"
  }
}


resource "aws_security_group" "test_sec_group" {
  name        = "test_sec_group"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.vpc_stage.id

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "test_sec_group"
  }
}

resource "aws_network_interface" "test_network_interface" {
  subnet_id       = aws_subnet.test_subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.test_sec_group.id]
}


resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.test_network_interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.test_gateway
  ]
}


resource "aws_instance" "test_instance" {
  ami               = "ami-00874d747dde814fa"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "test_key"

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.test_network_interface.id
  }


  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt intall nginx net-tools -y
sudo systemctl start nginx
EOF

  tags = {
    Name = "test_instance server"
  }
}


output "public-ip" {
  value = aws_eip.one.public_ip
}
