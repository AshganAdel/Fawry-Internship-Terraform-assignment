resource "aws_security_group" "instance" {
  name        = "poc-${var.env}-security_group"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = {
      ssh  = { port = 22, cidrs = ["0.0.0.0/0"] }
      http = { port = 8080, cidrs = ["0.0.0.0/0"] }
    }
    content {
      description = ingress.key
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidrs
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "poc-${var.env}-security_group"
  }
}

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "poc-${var.env}-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/ec2_key.pem"
  file_permission = "0400"
}

resource "aws_instance" "ec2" {
  count                  = var.instance_count
  ami                    = "ami-05f991c49d264708f"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = element(var.public_subnet_ids[*], count.index % length(var.public_subnet_ids))
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "poc-${var.env}-ec2-${count.index}"
  }
}
