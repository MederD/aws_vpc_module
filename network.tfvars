# Network infrastracture variables
cidr_block_vpc          = "10.0.0.0/16"
region                  = "us-east-1"
prefix                  = "Terraform"
instance_tenancy        = "default"
sub_cidr_public         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
sub_cidr_private        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
az_public               = ["us-east-1a", "us-east-1b", "us-east-1c"]
az_private              = ["us-east-1d", "us-east-1e", "us-east-1f"]

