variable "name" {
  description = "Environment/application name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS"
  type        = list(string)
}

variable "ecs_cpu" {
  description = "ECS task CPU"
  type        = number
}

variable "ecs_memory" {
  description = "ECS task memory"
  type        = number
}

variable "ecs_desired_count" {
  description = "Number of ECS tasks"
  type        = number
}
