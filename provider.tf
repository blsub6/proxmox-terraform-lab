# terraform {
#   required_providers {
#     proxmox = {
#       source  = "Telmate/proxmox"
#       version = "2.9.11"
#     }
#   }
# }
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.0.1"
    }
  }
}


# provider "proxmox" {
#   pm_api_url      = "https://192.168.2.200:8006/api2/json"
#   pm_user         = "root@pam"
#   pm_password     = "Hurried-Remodeler-Labrador1"
#   pm_tls_insecure = true
# }
provider "proxmox" {
  endpoint = "https://192.168.2.200:8006/api2/json"
  insecure = true

  username = "root@pam"
  password = "Hurried-Remodeler-Labrador1"

}