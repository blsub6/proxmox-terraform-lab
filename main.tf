resource "proxmox_vm_qemu" "ubuntu_server" {
  name        = "ubuntu-server"
  target_node = "proxmox-node-name"  # Your Proxmox node name
  clone       = "ubuntu-cloudinit-template"  # The name of your cloud-init template

  os_type = "cloud-init"

  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

  ipconfig0 = "ip=dhcp"

  sshkeys = file("~/.ssh/id_rsa.pub")
}

#test