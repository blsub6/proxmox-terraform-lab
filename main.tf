resource "proxmox_virtual_environment_vm" "ansible" {
  name       = "ansible"
  node_name  = "host"                      
  vm_id      = 109                        
  clone {
    vm_id = 203              
    full  = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "HDD"            
    file_format  = "qcow2"
    interface    = "scsi0"
    size         = 8
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
  }

  agent {
    enabled = true
  }

  boot_order = ["scsi0"]
  started    = true

  initialization {
    ip_config {
     ipv4 {
        address = "192.168.20.5/24"
        gateway = "192.168.20.1"
      }
    }

    dns {
      servers = ["8.8.8.8", "8.8.4.4"]
    }

    user_account {
      username = "user"
      keys  = [var.ssh_key]
    }
  }
}
resource "proxmox_virtual_environment_vm" "nginx" {
  name       = "nginx"
  node_name  = "host"                      
  vm_id      = 110                      
  clone {
    vm_id = 203              
    full  = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "HDD"            
    file_format  = "qcow2"
    interface    = "scsi0"
    size         = 8
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
  }

  agent {
    enabled = true
  }

  boot_order = ["scsi0"]
  started    = true

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.20.6/24"
        gateway = "192.168.20.1"
      }
    }

    dns {
      servers = ["8.8.8.8", "8.8.4.4"]
    }

    user_account {
      username = "user"
      keys  = [var.ssh_key]
    }
  }
}
