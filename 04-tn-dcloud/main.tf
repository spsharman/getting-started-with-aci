terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = ">=2.13.2"
    }
  }
}

provider "aci" {
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
}

module "aci" {
    # source = "github.com/netascode/terraform-aci-nac-aci?ref=main"
  source  = "netascode/nac-aci/aci"
  version = ">=0.8.1"

  # yaml_directories = ["data"]

  yaml_files = ["data/01-creates-tenants-vrf-and-bridge-domains.nac.yaml"]
  # yaml_files = ["data/02-adds-epgs.nac.yaml"]
  # yaml_files = ["data/03-adds-single-esg-for-all-epgs.nac.yaml"]
  # yaml_files = ["data/04-adds-finance-esgs-and-contracts.nac.yaml"]
  # yaml_files = ["data/99-full-configuration.nac.yaml"]

  manage_access_policies    = false
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true
}
