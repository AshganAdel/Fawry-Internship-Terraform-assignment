resource "aws_security_group" "instance" {
  name        = "poc-${var.env}-security_group"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = {
      ssh  = { port = 22, cidrs = ["0.0.0.0/0"] }
      http = { port = 80, cidrs = ["0.0.0.0/0"] }
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

resource "aws_instance" "ec2" {
  count                  = var.instance_count
  ami                    = "ami-05f991c49d264708f"
  instance_type          = "t2.micro"
  subnet_id              = element(var.public_subnet_ids[*], count.index % length(var.public_subnet_ids))
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "poc-${var.env}-ec2-${count.index}"
  }
}
