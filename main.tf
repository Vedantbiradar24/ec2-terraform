resource "aws_security_group" "web1" {
  name        = "webserver1"
  description = "demo"
  vpc_id      = data.aws_vpc.myvpc.id
}

resource "aws_security_group_rule" "web1-ssh_port" {
  type              = "ingress"
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block_ssh_port]
  security_group_id = aws_security_group.web1.id
  depends_on        = [aws_security_group.web1]

}

resource "aws_instance" "webserver1" {
  count = var.create_instances ? length(var.ec2_instance_name) : var.demo1 ? 1 : 0 

  ami             = data.aws_ami.ubuntu_ami.id
  instance_type   = "t3.micro"
  key_name        = "localhost"
  subnet_id       = data.aws_subnet.us-east-1a.id
  security_groups = [ aws_security_group.web1.id ]
  depends_on      = [aws_security_group.web1, aws_security_group_rule.web1-ssh_port]

  tags = {
    "Name" =  var.create_instances ? var.ec2_instance_name[count.index] : "demo1"
  }

}
