provider "aws" {}

resource "aws_instance" "master" {
  count         = var.num_masters
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "${var.instance_name}-master${count.index + 1}"
  }
}

resource "aws_instance" "worker" {
  count         = var.num_workers
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "${var.instance_name}-worker${count.index + 1}"
  }
}

output "master-ip-address" {
  value = [for instance in aws_instance.master : instance.private_ip]
}

output "worker-ip-address" {
  value = [for instance in aws_instance.worker : instance.private_ip]
}

