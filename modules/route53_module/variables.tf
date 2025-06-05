variable "nhom16_route53_zone_name" {
  description = "The name of the Route 53 hosted zone"
  type        = string
}
variable "nhom16_route53_record_type" {
  description = "The type of the Route 53 record (e.g., A, CNAME)"
  type        = string
}
variable "nhom16_route53_record_alias_name" {
  description = "The alias name for the Route 53 record"
  type        = string
}
variable "nhom16_route53_record_alias_zone_id" {
  description = "The zone ID for the Route 53 record alias"
  type        = string
}