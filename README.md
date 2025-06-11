[![Terraform Version](https://img.shields.io/badge/terraform-%5E1.3-blue)](https://www.terraform.io)

# ACI NAC for "getting-started-with-cisco-aci-6.0-v1.1"

This code is was created for the CISCOU-2065 presentation at Cisco Live 2025 in San Diego.

## Getting started

- Schedule the ["getting-started-with-cisco-aci-6.0-v1.1"](https://dcloud2-lon.cisco.com/content/demo/614928) on the Cisco dCloud from your preferred closest location
- Install [Terraform](https://developer.hashicorp.com/terraform/install)
- Download the [code](https://github.com/spsharman/getting-started-with-aci.git) to your local machine

Once the code is downloaded you will see the following directory structure:

- 01-node-policies
  - this plan will do the following:
    - add the switches to APIC - **note** there is no need to manually register the switches
    - configure their management IP addresses
- 02-fabric-policies
  - this plan will do the following:
    - add global settings
    - add route reflectors
    - add banners
    - add NTP policiy
    - add DNS policy
    - add VMM domain - i.e. create a new VDS on vCenter
- 03a-access-policies-new-model
  - this plan will do the following:
    - add VLAN pool
    - add domain
    - add AAEP
    - add interface policies
    - add policy groups
    - add interfaces using the "new" interface [configuration](https://community.cisco.com/t5/data-center-and-cloud-knowledge-base/aci-interface-configuration-version-6-0-5-2-7-or-later/ta-p/4948368) option
- 03b-access-policies-old-model
  - this plan will do the following:
    - add VLAN pool
    - add domain
    - add AAEP
    - add interface policies
    - add policy groups
    - add leaf profiles
    - add switch profiles
- 04-tn-dcloud
  - this folder contains the following plans
    - 01-creates-tenants-vrf-and-bridge-domains
    - 02-adds-epgs
    - 03-adds-single-esg-for-all-epgs
    - 04-adds-finance-esgs-and-contracts
    - 99-full-configuration

The tenant options show how to migrate from a "network centric" design to an "application centric" design.

![tenant](assets/image-large.gif)

## Initializing Terraform

Each plan directory will need to have terraform initialized, to do this simply open a command line prompt inside each of the directories and enter `terraform init`.

It is important to execute the terraform plans in order from the command line:

- navigate to 01-node-policies:
  - enter `terraform init` - this will download all the required files (this is a one time operation)
  - enter `terraform plan` - this will plan the deployment
  - enter `terraform apply` - this will run and prompt you to confirm that you will to apply the plan
  - optionally - enter `terraform apply -auto-approve`
- navigate to 02-fabric-policies:
  - enter `terraform init` - this will download all the required files (this is a one time operation)
  - enter `terraform plan` - this will plan the deployment
  - enter `terraform apply` - this will run and prompt you to confirm that you will to apply the plan
  - optionally - enter `terraform apply -auto-approve`
- navigate to either 03a-access-policies-new-model **OR** 03b-access-policies-old-model:
  - enter `terraform init` - this will download all the required files (this is a one time operation)
  - enter `terraform plan` - this will plan the deployment
  - enter `terraform apply` - this will run and prompt you to confirm that you will to apply the plan
  - optionally - enter `terraform apply -auto-approve`

Once the above steps have been completed you will be in a position to select which plan you wish to apply to configure the tenant.

- navigate to 04-tn-dcloud:
  - enter `terraform init` - this will download all the required files (this is a one time operation)
  - edit `main.tf`

The `main.tf` contains the following lines:

```
  yaml_files = ["data/01-creates-tenants-vrf-and-bridge-domains.nac.yaml"]
  # yaml_files = ["data/02-adds-epgs.nac.yaml"]
  # yaml_files = ["data/03-adds-single-esg-for-all-epgs.nac.yaml"]
  # yaml_files = ["data/04-adds-finance-esgs-and-contracts.nac.yaml"]
  # yaml_files = ["data/99-full-configuration.nac.yaml"]
```

To execute the different plans simply comment/uncomment the NAC file that you wish to apply:

- enter `terraform plan` - this will plan the deployment
- enter `terraform apply` - this will run and prompt you to confirm that you will to apply the plan
- optionally - enter `terraform apply -auto-approve`

To destroy a deployment

- enter `terraform destroy` - this will run and prompt you to confirm that you will to apply the plan
- optionally - enter `terraform destroy -auto-approve`
<Br>
<Br>

For more information on Network as Code please visit [netascode.cisco.com](https://netascode.cisco.com) and navigate to the [APIC Data Model](https://netascode.cisco.com/docs/data_models/apic/overview/)

