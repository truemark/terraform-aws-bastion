variable "name" {
  type        = string
  description = "Name of the instance"
}

variable "create" {
  default     = true
  type        = bool
  description = "Set to false to not create any resources in this stack"
}

variable "instance_type" {
  default     = "t4g.micro"
  type        = string
  description = "EC2 instance type to use for the gateway"
}

variable "ingress_cidrs_blocks" {
  description = "List of allowed CIDRs that can access this RDS instance."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ipv6_ingress_cidrs_blocks" {
  description = "List of allowed CIDRs that can access this RDS instance."
  type        = list(string)
  default     = ["::/0"]
}

variable "egress_cidrs_blocks" {
  description = "Default allowed CIDRs for egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ipv6_egress_cidrs_blocks" {
  description = "Default allowed CIDRs for egress"
  type        = list(string)
  default     = ["::/0"]
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC to provision the EC2 instance in"
}

variable "subnet_id" {
  type        = string
  description = "The subnet to provision the EC2 instance in"
}

variable "ami" {
  default     = null
  type        = string
  description = "Optional AMI to use. Default is to use the latest Ubuntu 20.04 amd64 image"
}

variable "key_name" {
  default     = null
  type        = string
  description = "SSH key pair to use"
}

variable "ssh_keys" {
  default     = []
  type        = list(string)
  description = "List of SSH public keys to be added to the authorized_keys file"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Additional tags for all resources"
}

variable "instance_tags" {
  default     = {}
  type        = map(string)
  description = "Additional tags for the EC2 instance"
}

variable "security_group_tags" {
  default     = {}
  type        = map(string)
  description = "Additional tags for the Security group"
}

variable "root_volume_size" {
  default     = 20
  type        = number
  description = "Size of the root volume"
}

variable "enable_ssm" {
  type        = bool
  default     = true
  description = "Enable or disable SSM on this instance"
}

variable "instance_suffix" {
  type        = string
  default     = "-bastion"
  description = "The suffix to use on the name when creating the EC2 instance"
}

variable "ami_name_filters" {
  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  description = "Name filter to use when searching for AMIs"
}

variable "ami_owners" {
  type        = list(string)
  default     = ["099720109477"]
  description = "Owner filter to use when searching for AMIs"
}

variable "force_deploy" {
  type        = bool
  default     = false
  description = "Forcibly re-deploy the EC2 instance."
}

variable "postgres_version" {
  type = string
  default = "15"
  description = "Version of the PostgreSQL client to install."
}
