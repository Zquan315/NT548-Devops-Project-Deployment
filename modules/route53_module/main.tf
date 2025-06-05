resource "aws_route53_zone" "nhom16_route53_zone" {
  name = var.nhom16_route53_zone_name
}

resource "aws_route53_record" "nhom16_route53_record" {
  zone_id = aws_route53_zone.nhom16_route53_zone.zone_id
  name    = var.nhom16_route53_zone_name
  type    = var.nhom16_route53_record_type
  alias {
    name                   = var.nhom16_route53_record_alias_name
    zone_id                = var.nhom16_route53_record_alias_zone_id
    evaluate_target_health = true
  }
}