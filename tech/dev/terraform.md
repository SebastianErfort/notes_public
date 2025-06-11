---
title: Terraform
aliases:
  - Terraform
developer: "[[Hashicorp]]"
tags:
  - dev/terraform
  - dev/iac
visibility: public
type: software
category:
  - IaaS
  - IaC
same:
  - "[[OpenTofu]]"
up:
  - "[[iac]]"
  - "[[iac|IaaS]]"
docs: https://developer.hashicorp.com/terraform/docs
url: https://terraform.io/
---
`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")` | [Registry]
[Awesome Terraform][awesome-tf]
# Terraform

- tool and language
- manage and create hosts on different cloud providers
- provisioners: configure hosts - considered last resort
- deploy pre-made server images
- base images can be create e.g. with [[Packer]]
- immutable and disposable infrastructure
- desired state file `*.tf`, current state file `*.tfstate`

Integrations
- can also manage containers: Docker, Kubernetes (e.g. [[eks|Amazon EKS]])
- 219 officially supported providers (corresponds to Puppet modules), talking to APIs: 1Password, ngrok, ...
- Provisioners are strongly discouraged

Workflow
- repo > connect to Terraform
- commit to repo > Terraform run: plan
- confirm: apply

## Providers

### AWS

```tf
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
```

## Resources

[Documentation: Resources][tf-docs-resources] | [examples](file://rsrc/terraform/example)

- resources of different types can have the same name (convenient)

## Variables

```tf
# output: return after apply and accessible to other code
output "instance_public_ip" {
  value = aws_instance.web_app.public_ip
}
```

### Resource Types

```tf
resource "aws_vpc" "qa" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_vpc" "stg" {
  cidr_block = "10.1.0.0/16"
}
resource "aws_vpc" "prod" {
  cidr_block = "10.2.0.0/16"
}

resource "aws_security_group" "allow_tls" {
  # inbound traffic
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
  # outbound traffic
  egress {
    # any protocol on any port
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  }
}

resource "aws_instance" "blog" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"
}

resource "aws_eip" "blog" {
  instance = aws_instance.blog.id
  vpc      = true
}

# S3 bucket website with separate config to be independent of bucket data
resource "aws_s3_bucket" "example" {
  bucket = "unique_bucket_name"
  acl    = "public-read"
  policy = file("policy.json")
}

resource "aws_s3_bucket_website_config" "example" {
  bucket = aws_s3_bucket.example.bucket
  index_document {
    suffix = "index.html"
  }
}
```

## Style

- indentation: 2 spaces
- meta arguments: how Terraform should interpret a resource, e.g. `count = 2`
- block meta arguments: at end of resource definition
- blank lines for clarity
- group single arguments
- line up equal signs

Example
```tf
resource "aws_instance" "web" {
  count = 2

  ami           = "abc123"
  instance_type = "t2.micro"

  network_interface {
    # ...
  }

  lifecycle {
    create_before_destroy = true
  }
}
```

## Modules

- [registry.terraform.io]: official and community providers and modules
    - [AWS modules][tf-modules-aws]
        - [auto-scaling][tf-modules-auto-scaling] ^auto-scaling

Minimum files

```text
my_module
├── main.tf 
├── variables.tf 
├── output.tf 
└── README.md
```

- documentation for inputs and outputs can be auto-generated

## Tools & Frameworks

- [[serverless.tf]]
-  [terraform-kubestack](https://github.com/kbst/terraform-kubestack) | [www.kubestack.com](https://www.kubestack.com/ "https://www.kubestack.com")
    > Kubestack is a framework for Kubernetes platform engineering teams to define the entire cloud native stack in one Terraform code base and continuously evolve the platform safely through GitOps.

## References

- learning
    - [Terraform Course @freeCodeCamp.org][edu-tf-freecodecamp]
- repos & templates
    - [HariSekhon/Terraform](https://github.com/HariSekhon/Terraform)

[registry]: <https://registry.terraform.io/>
[tf-docs-resources]: <https://developer.hashicorp.com/terraform/language/resources>
[awesome-tf]: <https://github.com/shuaibiyy/awesome-tf>
[edu-tf-freecodecamp]: <https://www.youtube.com/watch?v=SLB_c_ayRMo&ab_channel=freeCodeCamp.org>
[tf-modules-aws]: <https://registry.terraform.io/namespaces/terraform-aws-modules>
[tf-modules-auto-scaling]: <https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest>
