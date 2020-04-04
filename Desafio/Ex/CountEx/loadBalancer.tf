resource "aws_elb" "web" {
  count = var.NUMERO_NODES
  subnets         = data.aws_subnet_ids.all.ids
  security_groups = ["${aws_security_group.allow-ssh[count.index].id}"]
  name = "${format("elb-${terraform.workspace}-%03d", count.index + 1)}"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 6
  }

  # The instances are registered automatically
  instances = aws_instance.web.*.id
  
  tags = {
    Name = "${format("elb-${terraform.workspace}-%03d", count.index + 1)}"
  }
}