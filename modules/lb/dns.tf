data "aws_route53_zone" "main" {
  name = "cloud-sata.com"
}

resource "aws_route53_record" "name" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.${data.aws_route53_zone.main.name}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.main.dns_name]
}
