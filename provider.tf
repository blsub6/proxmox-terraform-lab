terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.2.200:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "Hurried-Remodeler-Labrador1"
  pm_tls_insecure = true
}
