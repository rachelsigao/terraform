resource "aws_instance" "roboshop" {
    # for_each = var.instances (when the variable is a map)
    for_each = toset(var.instances) # when the variable is list, toset function converts list to set)
    
    ami = var.ami_id # left and right side names no need to be same
    
    # instance_type = each.value (when the variable is a map, each.value will give you the value of the map (t3.micro, t3.micro, t3.small, t3.micro))
    instance_type = "t3.micro" # when the variable is a list 
        vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    
tags = {
    Name = each.key # when the variable is a map, each.key will give you the key of the map (mongodb, redis, mysql, rabbitmq)
  }
}

resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}