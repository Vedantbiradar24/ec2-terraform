variable "key_name" {
  default     = "localhost"
  type        = string
  description = "ec2 instance key pair name"
}

# -var key_name=localhost or --var-file=path

variable "ubuntu_version" {
  default     = "26.04"
  type        = string
  description = "ubuntu ami version"
}

variable "ssh_port" {
  default     = 22
  description = "open port ssh"
  type        = number
}

variable "cidr_block_ssh_port" {
  default     = "0.0.0.0/0"
  type        = string
  description = "ssh open cidr block"
}

## backend details

variable "bucket_name" {
  default = "aws-infra-qt-devops"
  type = string
  description = "bucket name or s3 "
}

variable "bucket_key" {
  default = "ec2-terraform.tfstate" 
  type = string
}

variable "enviroment" {
  default = "dev"
  type = string  
}


variable "region" {
  default = "us-east-1"
  type = string
}

variable "aws_vpc_name" {
  type = string
  default = "demo-vpc"
  
}


variable "create_instances" {
  type = bool
  default = true
}


variable "ec2_instance_name" {
  default = [ "demo1", "demo2" ] 
  type = list(string)
}

variable "demo1" {
  type = bool
  default = false
}