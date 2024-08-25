# sre-lab-terraform

- This is following the course terraform-beginner-to-advanced conducted by Zeal Vora from Udemy.


## Code Repo

- The link to code repo associated with this course as follows.
    - https://github.com/zealvora/terraform-beginner-to-advanced-resource


## Authentication

- Create a user for the terraform to access AWS services.

- Storing access keys and secrets on the provider block

```terraform
provider "aws" {
    shared_config_files = ["path/to/config"]
    shared_cred_files   = ["path/to/creds"]
    profile             = "custom"
}
```

- If these were not defined, by default aws provider will check for the following paths;
> On Linux and MacOS
> - @HOME/.aws/config
> - @HOME/.aws/credentials

> On Windows
> - "%USERPROFILE%\\.aws\config"
> - "%USERPROFILE%\\.aws\credentials"

- Provider specific credential / authentication - AWS

```terraform
provider "aws" {
    assume_role {
        role_arn        = "arn:aws:iam::123456789:role/ROLE_NAME"
        session_name    = "SESSION_NAME"
        external_id     = "EXTERNAL_ID"
    }
}
```



## Terraform provider versioning

| Version Number Arguments | Description |
| --------- | ---------|
| `"3.70"` | Explicitly mentioned version |
|`">=1.0"` | Greater than equal to the version |
| `"<=1.0"` | Less than equal to the version |
| `"~>2.0"` | Any version in the 2.X range |
| `">=2.10,<=2.30"` | Any version in between 2.10 and 2.30 |

- When `terraform init` is executed it will check for the dependency lock file _.terraform.lock.hcl_ file where the constraints for the providers are configured when the repo was initialized for the first time.
> - To change this we need to delete the file and re initialize the repo with the changes to the provider constraints.

- Else can execute `terraform init -upgrade` which will update the _.terraform.lock.hcl_ file with new configuration.

## Terraform commands

- `terraform init` initializes the terraform repo and installs the providers.
- `terraform fmt` formats the terraform code base to a alligned code base.
- `terraform plan` plans and shows what're the intended changes to be applied.
- `terraform apply` applies the planned changes.
- `terraform destroy` destroy all the infrastructure created from the code base.

## Terraform Apply

- `terrafome apply -auto-approve` will auto approve the apply and no need for manula interactions for applying changes.

### Terraform Destroy

- `terraform destroy -target aws_instance.iroshanv-devops-srelab-ec2` this will only destroy the target instance.

## Desired and Current State

- Desired state is the state defined in the terraform code.
- Current state is the state of the infrastructure. This may not be always equal to the desired state
- As manual interventions can happen, the current state could have been changed.
- Once the terraform apply is executed again, the current state will be changed to the desired state.

> - Desired state is defined as the code we have declared in the repo. If there's only ami and instance_type is declared, the security group is not a desired value.
> - Therefore, whenever declaring resources should declare every aspect of that particular resource.


## Terraform refresh

- `terraform refresh` is used to update the state file about the current state of the deployed infrastructure.
- When executing plan / apply this will be executed automatically no need to explicitly execute it everytime.
- This is dangerous to execute cause it could empty out the tfstate file completely.
- In newer versions `-refresh-only` option can be run since `refresh` has been deprecated.


## Attributes

- Are the fields in a resource that holds the values that ends up in the state.
- In the resource documents attributes of that particular resource block can be found at the end.
- Easy to find in the state file.
- *`resource.resource_name.attribute`* is the convention used.

> - In _cross resource attribute referencing_, terraform will automatically understands the order of resources should be created.


## Output Values

- The values will be made available to the terminal window and expose them so other terraform configurations can use them.
- Modules use output values when exporting data

```terraform
module "module_name" {
    source = "path/to/module"
}
```