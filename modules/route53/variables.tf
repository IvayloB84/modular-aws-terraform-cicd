# --- Route53 Hosted Zone Data Attributes ---
variable "route53_name" {
  type        = string
  description = "The root domain name lookup value for the hosted zone (e.g. mycompany.net)"
}

variable "private_zone" {
  type        = bool
  description = "True if looking up a private VPC zone, false if a public internet zone"
}

variable "api_domain_record" {
  type        = string
  description = "The specific prefix subdomain or domain name for this record (e.g. api.mycompany.net)"
}

variable "type" {
  type        = string
  description = "The DNS tracking protocol record type string (e.g. A, AAAA, CNAME, TXT)"
}

variable "ttl" {
  type        = number
  description = "The Time-To-Live cache invalidation limit tracking metric duration value in seconds"
}

variable "records" {
  type        = list(string) # FIX: Corrected syntax structure from string(list)
  description = "The destination route pointer target records values list mapping array (e.g. IPs or domains)"
}