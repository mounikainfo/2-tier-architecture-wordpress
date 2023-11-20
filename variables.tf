

variable "inbound_port_production_ec2" {
  type        = list(any)
  default     = [20, 80]
  description = "inbound port allow on production instance"
}

variable "db_name" {
  type    = string
  default = "wordpressdb"
}

variable "db_user" {
  type    = string
  default = "admin"
}
variable "db_password" {
  type    = string
  default = "Wordpress-AWS2Tier"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-0287a05f0ef0e9d9a"
}

variable "key_name" {
  type    = string
  default = "linux"
}

variable "availability_zone" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "target_application_port" {
  type    = string
  default = "80"
}


