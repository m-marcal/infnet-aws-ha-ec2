variable "project_name" {
  description = "The project name to be used as a prefix for resources"
  type        = string
  default     = "infnet"
}

variable "aws_region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "TIMDb_API_KEY" {
  description = "API Key for TIMDb"
  type        = string
}

# variable "bucket_name" {
#   description = "Name of the S3 bucket to create"
#   type        = string
# }

# variable "ami_id" {
#   description = "AMI ID for the EC2 instances"
#   type        = string
# }

# variable "asg_min_size" {
#   description = "Minimum size of the Auto Scaling Group"
#   type        = number
#   default     = 1
# }

# variable "asg_max_size" {
#   description = "Maximum size of the Auto Scaling Group"
#   type        = number
#   default     = 2
# }

# variable "asg_desired_capacity" {
#   description = "Desired capacity of the Auto Scaling Group"
#   type        = number
#   default     = 2
# }
