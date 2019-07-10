variable "dead_letter_arn" {
  description = "The arn for the SNS topic that handles dead letters"
  type        = string
}

variable "kms_key_arn" {
  description = "The arn of the KMS key used to encrypt the environment variables"
  type        = string
}

variable "log_bucket_id" {
  description = "The name or id of the log bucket to use for S3 server logging"
  type        = string
}

variable "name_prefix" {
  description = "The name prefix to use when naming the created resources"
  type        = string
}

variable "repo_locations" {
  description = "The locations within the bucket to create repos at. This is used to create repos for specific architectures if desired"
  type        = list(string)
}

variable "repo_whitelists" {
  description = "If present, restricts access to the repo to the listed CIDR blocks"
  default = [
    "0.0.0.0/0",
  ]
  type = list(string)
}

