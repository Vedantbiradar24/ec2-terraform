## data sources

data "aws_vpc" "myvpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.aws_vpc_name}"]
  }
}


data "aws_subnet" "us-east-1a" {
  vpc_id            = data.aws_vpc.myvpc.id
  availability_zone = "us-east-1a"
}

data "aws_subnet" "us-east-1b" {
  vpc_id            = data.aws_vpc.myvpc.id
  availability_zone = "us-east-1b"
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's official AWS account ID

  filter {
    name   = "name"
    # Fallback to standard hvm-ssd string if gp3 returns nothing in your targeted region
    values = ["ubuntu/images/hvm-ssd*/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


