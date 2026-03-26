resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.rachelsigao.online
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  # overwrite = true # overwrite the existing record if it already exists
}