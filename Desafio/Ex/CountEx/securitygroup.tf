resource "aws_security_group" "allow-ssh" {
  vpc_id      = "${data.aws_vpc.vpc.id}"
  count       = var.NUMERO_NODES
  
  name        = "${format("allow-ssh-${terraform.workspace}-%03d", count.index + 1)}"
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${format("allow-ssh-${terraform.workspace}-%03d", count.index + 1)}"
  }
}
