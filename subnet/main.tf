variable "vpc_id" {
    type = string
  
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string
  }))
  default = {}
}

resource "aws_subnet" "modexc" {
  for_each = var.subnets
  vpc_id     = var.vpc_id
  cidr_block = each.value.cidr_block #cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.key
  }
}


#  output "subnets" {
#     value = aws_subnet.modexc[each.key]
   
#  }