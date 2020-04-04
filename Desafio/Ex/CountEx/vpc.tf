data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.vpc.id}"

  tags = {
    Tier = "Public"
  }
}

data "aws_subnet" "public" {
  for_each = data.aws_subnet_ids.all.ids
  id = "${each.value}"
}

data "aws_vpc" "vpc" {
  tags = {
    Name = "${var.project}"
  }
}

resource "random_shuffle" "random_subnet" {
  input        = [for s in data.aws_subnet.public : s.id]
  result_count = 1
}