## AWS VPC Terraform module  
### Terraform module which creates VPC resources on AWS.

**Provision Instructions:**

Copy and paste into your Terraform configuration, insert the variables, and run terraform init:  

```
module "vpc" {
  source  = "github.com/MederD/aws_vpc_module"
  version = "1.0"
  # insert variables here
}
```

**Created resources:**  
* VPC.
* Subnets (public and private).
* Internet Gateway.
* NAT GAteway.
* Elastic IP (if 'define_eip' will set to 'true'.)
* Route tables (public and private) and route table associations.

**Variables for configuration:**  
```
cidr_block_vpc
region        
prefix                
instance_tenancy      
sub_cidr_public      
sub_cidr_private      
az_public         
az_private    
define_eip      
```

**Outputs:**  
* VPC information.
* Public subnet information.
* Private subnet information.
* Elastic IP information.



