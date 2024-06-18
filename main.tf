terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "5.54.1"
		}
	}
}
provider "aws" {
	region = "us-east-1"
}
resource "aws_vpc" "web_vpc" {
	cidr_block = "192.168.100.0/24"
	enable_dns_hostnames = true
	tags = {
		Name = "Web VPC"
	}
}
