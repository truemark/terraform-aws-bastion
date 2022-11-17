# AWS Bastion

This Terraform module provisions an EC2 instance to be used as a bastion.

Example Usage
```hcl
module "bastion" {
  source  = "truemark/bastion/aws"
  name = "mybastion"
  vpc_id = "<VPC ID>"
  subnet_id = "<SUBNET ID>"
  ssh_keys = [
      "ssh-rsa <SSH_KEY>",
      "ssh-rsa <SSH_KEY>",
  ]
}
```
