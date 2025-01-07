variable "domain_name" {
  type        = string
  description = "Name of the domain"
  default     = "servarccarwash.com"
}
variable "bucket_name" {
  type        = string
  description = "Name of the bucket"
  default     = "playbliss-app-2025"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
