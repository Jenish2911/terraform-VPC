## AWS VPC with Terraform

This project demonstrates creating a Virtual Private Cloud (VPC) in AWS using Terraform.

### Prerequisites

* Terraform installed: [https://www.terraform.io/](https://www.terraform.io/)
* AWS account with credentials configured for Terraform: [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)

### Setting Up

1. Create a directory for your project:
   ```bash
   mkdir infra && cd infra
   ```
2. Initialize the Terraform working directory:
   ```bash
   terraform init
   ```

### Creating the VPC

The Terraform configuration is defined in the `main.tf` file. 

### Configuration (`main.tf`)

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.48.0"  # Update as needed
    }
  }
}

provider "aws" {
  region = "us-west-2" # Update region if needed
}

resource "aws_vpc" "web_vpc" {
  cidr_block          = "192.168.100.0/24"
  enable_dns_hostnames = true
  tags = {
    Name = "Web VPC"
  }
}
```

This configuration defines a VPC resource named `web_vpc` with the following properties:

* `cidr_block`: The network address range for the VPC (192.168.100.0/24 in this example).
* `enable_dns_hostnames`: Enables DNS hostnames within the VPC.
* `tags`: Assigns a tag named "Name" with the value "Web VPC" for easier identification.

### Applying the Configuration

1. Run `terraform plan` to preview the changes Terraform will make.
2. Review the plan and confirm if it matches your expectations.
3. Apply the changes with `terraform apply`. You'll be prompted to confirm before applying.

### Verifying in AWS Console

Log in to the AWS Management Console and navigate to the VPC service. You should see the newly created VPC with the name "Web VPC" (or the ID displayed by Terraform).
