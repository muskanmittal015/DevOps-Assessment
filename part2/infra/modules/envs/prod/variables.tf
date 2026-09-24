variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "myapp-prod"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}
variable "ecs_cpu" {
  type = number
}

variable "ecs_memory" {
  type = number
}

variable "ecs_desired_count" {
  type = number
}
