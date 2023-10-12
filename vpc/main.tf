resource "aws_vpc" "modexc" {
    cidr_block = var.vpc_cidr
}

variable "vpc_cidr" {
    type = string
    
}

output "vpc_id" {
    value = aws_vpc.modexc.id
  
}