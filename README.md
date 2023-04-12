# Terraform #

## To create a VPC network ##

## To create a Subnetwork within the VPC network ##

## To create two VMs within the Subnetwork ##


```bash

terraform apply

```
> Add the depends_on parameter within each creation so that all the processes do not run in parallel. 

### Running the processes parallely results in errors as the delays in the creation of VPC network and the Subnetwork cause the VMs not to be created. ###
