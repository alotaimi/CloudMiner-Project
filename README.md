# CloudMiner-Project

The primary purpose of this project is to fully automate the creation of the EC2 Instance using Terraform and the set up of the Minecraft server using Bash within the Terraform file.

Note: The EC2 instance that will be created is on “us-east-1,” if you want to run it on a different region, go to “main.tf.” Then, edit line 13. And also, check if the ami is available for that given region.

## Requirements

1. Terraform CLI → You can install it by following [1].
2. AWS CLI → You can install it by following [2].

After installing these two, please configure your AWS configuration by running this command:

```bash
vim ~/.aws/credentials # This will open up the config using Vim. You can also use any editor you like.
```

And, then adding these 4 lines to the file:

```bash
[default]
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
aws_session_token = IQoJb3JpZ2luX2IQoJb3JpZ2luX2IQoJb3JpZ2luX2IQoJb3JpZ2luX2IQoJb3JpZVERYLONGSTRINGEXAMPLE
```

To know more about your credentials, refer to this [3].

## How to run the Pipeline

1. Clone the repository 
2. Initialize Terraform by running this command: 

```bash
terraform init
```

It will initialize the current directory in order to use Terraform.

1. Let Terraform make the changes to your AWS by running this command:

```bash
terraform apply -auto-approve
```

This command will execute the “main.tf” file, which will create the EC2 Instance and setup the Minecraft server.

## How to connect to the server

After you run the apply command, you will see an output similar to this “The_Public_IP_address_of_the_Minecraft_Server = 123.123.123.123.” This IP address is the IP that you will use to connect to the server from the client side.

### References

1. [Install Terraform | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Installing or updating the latest version of the AWS CLI - AWS Command Line Interface (amazon.com)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. [Configuration and credential file settings - AWS Command Line Interface (amazon.com)](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)