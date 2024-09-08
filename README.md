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

## Variables

- Static values can be stored as variable where repeatedly apply in the code.


### Declaring in variables file

- Default tfvars file name is _terraform.tfvars_ no need to mention the file name, terraform will automatically load values from it.


### Declaring environment specific variables

- Maintain *.tfvars files for multiple environments.
- When executing terraform command for plan/apply `terraform plan -var-file="prod.tfvars"` used to define which tfvars to be used here.
- In variables if we have configured a default value, it'll only be used if we haven't explicitly configured an enviranment specific value for the variable.


### Declaring variables in CLI

- If we havn't declared a value for a variable, terraform will ask to enter a value when plan / apply is being executed.
- `terraform plan -var="instance_type=m5.large"` this way, terraform won't prompt to ask for undeclared variables.


### Environment Variables

- `TF_VAR_variable` This is the standard env variables in Terraform. For _instance\_type_ variable it should be `TF_VAR_instance_type`

> In linux `printenv` will print all the env variables
>   - `export TF_VAR_instance_type=m5.large`

> In Windows `echo $env:path` `echo $env:JAVA_PATH`
>   - In case the environment variable label contains characters otherwise interpreted as bareword token terminators (like `.` or `-` or ` `), qualify the variable path expression with {...}:
>>  `${env:MINISHIFT-USERNAME}`
>   - Can also enumerate all variables via the `env` drive:
>>  `Get-ChildItem env:`


### Variable definition Precedence

- Terraform loads variables in the following order highest precedence will be the first one
    - -var / -var-file options on the cli.
    - *.auto.tfvars / *.auto.tfvars.json processed in lexical order
    - terraform.tfvars.json
    - terraform.tfvars
    - Environment variables
> The default values assigned when variables are declared will always be overridden if any of the above type exists.


## Data Types

- Can restrict variable value to Data Type. 
- `type=` is used to restrict the value type.
>   The error will be `Error: Invalid value for input variable`
- Even attributes has value types. Can be seen in the argument references.
- List type can have one or multiple values at a time. has squre brackets.
    - For list, can restrict the type of values to be included in lists.
    >    `type = list(number)` \-\> list = ["1","2","3"]

- Map type has key value pairs and has curly brackets.


### Fetching / Referencing data from Maps and Lists


## COUNT Meta-Argument

- Used to create the identical resources repeatedly (multiple), example 30 ec2 instances.
- Not restricted to ec2, but other resources as well.
- Depending on the amount of resources being created, it might be hard to handle the instances. Hence will need some level of customizations.
- Some resources have uniqueness in their resources and, need to have a unique identifier/name.


### COUNT.INDEX

- `count.index` holds a distinct index number, starting from 0.
- Each resource will have a unique index.


## Conditional Expressions

- _condition ? true\_value : false\_value_ - similar to if conditions


## Functions

- Built-in Functions :- which are already defined in the framework itself.
- Can be used to farious functions to be executed within the Terraform code.
- Terraform doesn't support user defined functions.


## Local Values

- Locals are used to centrally store common data.
- In a sense similar to variables, but can do more in locals.
- But in locals can add expressions, which allows you to compute values dynamically.


## Data Sources

- Allow Terraform to use / fetch info defined outside of Terraform
- When using data sources, always refere to the documentation.


### Filters

- Used to filter out a specific or a group of recources to be used by data resources.
 

## Debugging Terraform

- Has detailed logs that can be enabled by setting the **TF_LOG** env variable to any value.
- you can set the variable to one of the below log levels (in order of decreasing verbosity).
- Linux: `export TF_LOG=INFO`
- Windows: `set TF_LOG=INFO` - This will only be set to the session (temparory).

|**Log Level**|
|-----------|
|TRACE|
|DEBUG|
|INFO|
|WARN|
|ERROR|

- Can set the log file path by configuring **TF_LOG_PATH**.
- By default log will be printed in std out.
- After setting the verbose logging will be re-directed to the file in the log path.


## Terraform Troubleshooting

- Four potential types of error could be occured.
    - language: HCL - Hashicorp Configuration Language
    - State: state locks happen when state is out of sync: for this you can `terraform force-unlock LOCK_ID`
    - Core: Terraform bugs
    - Provider: The provider related issues


## Dynamic Blocks

- Dynamic blocks allows us to dynamically construct repeatable nested blocks which is supported inside the following blocks;
    - resource
    - data
    - provider
    - provisioner

```terraform
dynamic "example" {
    
}
```


## Terraform Validate

- Used to validate the configuration files


## Terraform Format

- Used to format the configuration files in to a more ordered and justified manner.


## Terraform Taint

- Cloud resource can be managed by the terraform or using other resources (cdk / manual), if a tf managed resource has been altered manually, then we can use tainting to replace or delete / recreate the resource.
- `terraform apply -replace="aws_instance.secondary-instance"`
- Terraform will destroy and create a new instance.
- Previously in older versions there was a command `terraform taint` now this command is not recomended to use.


## Terraform Target

- To plan / apply only a specific resource can use `-target`.
- `terraform plan -target="aws_security_group.rules_within_vpc" -var-file=dev.tfvars`

