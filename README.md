# Terraform #

## To create a VPC network ##

## To create a Subnetwork within the VPC network ##

## To create two VMs within the Subnetwork ##

The variables within the .tf file are: 

- project_name --- The name of your GCP project.
- vpc_name --- The name of the VPC to be created in your GCP project.
- vms --- The names of the VMs that you intend to provide.
- subnet_name --- The names of the subnetwork that you intend to create in your VPC created. 

Create a .tfvar file and enter the following information:
```bash
// Provide the names of the variables

project_name="Project_Name"
vpc_name="VPC_Name"
vms="VM_Names"
subnet_name="Subnetwork_Name"

```
Assuming that the name of the .tfvar file you created is **variables.tfvar**

Apply the following code for the resources to be created:
```bash

terraform apply -var-file=variables.tfvar

```
> Add the depends_on parameter within each creation so that all the processes do not run in parallel. 

### Running the processes parallely results in errors as the delays in the creation of VPC network and the Subnetwork cause the VMs not to be created. ###
