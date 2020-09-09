variable "ami_image"  {
  default = "ami-b70554c8"
}

variable "name" {
  description = "Name of the Instance"
  default = "Instance1"
}

#variable "security_groups" {
 # default = ["sg-017011d5ea42dde9b"]
#}

variable "subnets" {
  default = "subnet-10c8635d"
}

variable "availability_zones" {
  default = "us-east-1b"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ashok"
}

variable "vpc" {
  default = "vpc-26e8dc5c"
}
 

