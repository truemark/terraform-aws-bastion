# AWS Bastion

This Terraform module provisions an EC2 instance to be used as a bastion.

Example Usage
```hcl
module "bastion" {
  source  = "truemark/bastion/aws"
  name = "mybastion"
  ssh_allowed_cidr_blocks = local.ssh_allowed
  vpc_id = "<VPC ID>"
  subnet_id = "<SUBNET ID>"
  ssh_keys = [
      "ssh-rsa <SSH_KEY>",
      "ssh-rsa <SSH_KEY>",
  ]
}
```
