resource "aws_route53_record" "www" {
  count = length(var.instances) # loop count will run based on the length of the instances variables
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.rachelsigao.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}