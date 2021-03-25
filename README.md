## AWS VPC Terraform module  
### Terraform module which creates VPC resources on AWS.

**Provision Instructions:**

Copy and paste into your Terraform configuration, insert the variables, and run terraform init:  

```
module "vpc" {
  source  Example: "github.com/MederD/aws_vpc_module"
  version Example: "1.0"
  # insert variables here
}
```

**Created resources:**  
* VPC.
* Subnets (public and private).
* Internet Gateway.
* NAT Gateway.
* Elastic IP (if 'define_eip' will set to 'true'.)
* Route tables (public and private) and route table associations.

**Variables for configuration:**  
```
cidr_block_vpc          Example: "10.0.0.0/16"
region                  Example: "us-east-1"
prefix                  Example: "Dev"
instance_tenancy        Example: "default"
sub_cidr_public         Example: ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
sub_cidr_private        Example: ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
az_public               Example: ["us-east-1a", "us-east-1b", "us-east-1c"]
az_private              Example: ["us-east-1d", "us-east-1e", "us-east-1f"]
define_eip              Example: true     
```

**Outputs:**  
* VPC information.
* Public subnet information.
* Private subnet information.
* Elastic IP information.



