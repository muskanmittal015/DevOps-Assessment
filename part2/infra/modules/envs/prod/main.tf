terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "my-company-terraform-state"

    key = "prod/terraform.tfstate"

    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}
module "network" {
  source = "../../modules/network"

  vpc_cidr = var.vpc_cidr
}
module "ecs" {
  source = "../../modules/ecs"

  name = var.project_name

  aws_region = var.aws_region

  vpc_id = module.network.vpc_id

  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids

  ecs_cpu           = var.ecs_cpu
  ecs_memory        = var.ecs_memory
  ecs_desired_count = var.ecs_desired_count
}
module "rds" {
  source = "../../modules/rds"

  name = var.project_name

  vpc_id = module.network.vpc_id

  private_subnet_ids = module.network.private_subnet_ids

  ecs_security_group_id = module.ecs.ecs_security_group_id
}
