## AWS VPC Terraform module  
### Terraform module which creates VPC resources on AWS.

**Provision Instructions:**

Copy and paste into your Terraform configuration, insert the variables, and run terraform init:  

```
module "vpc" {
  source  = "github.com/MederD/terraform_sprintqa/tree/main/terraform_hw4/network_infrastracture"

  * insert variables here
}
```

**Created resources:**  
* VPC
* Subnets (public and private)
* Internet Gateway
* Route tables (public and private)

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
```



