locals {
  # публичный ssh ключь для доступа к созданным инстансам 
  # берем из файла с локальной системы
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}

provider "proxmox" {
  # определяем провайдера для создания инстансов
  # в данном случае параметры для подключения к кластеру Proxmox
  pm_api_url = "https://${var.proxmox_ip}:8006/api2/json"  
  pm_api_token_id = "${var.api_token_id}"
  pm_api_token_secret = "${var.api_token_secret}"

  #pm_user = "${var.pm_user}"
  #pm_password = "${var.pm_password}"


  pm_tls_insecure = true
  pm_debug = true
}

resource "proxmox_lxc" "git-server"{
  # создаем инстанс
  vmid = "100" 
  hostname = "git-server" 
  target_node = "cl2-node2" 
  ostemplate = "nfs-stor:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  unprivileged = true
  cores = 4
  memory = 4096


  password     = "cnjhjyf2"
  ssh_public_keys = local.ssh_public_key

  #features {
  #  fuse    = true
  #  nesting = true
  #}

  rootfs {
    storage = "pmx-vg"
    size    = "15G"
  }
  network {
      name = "eth0"
      bridge = "vmbr200"
      ip = "192.168.200.202/24"
      gw     = "192.168.200.1"
      ip6    = "auto"
  }
  network {
      name = "eth1"
      bridge = "vmbr500"
      ip = "91.211.184.210/26"
      ip6    = "auto"
  }
  hastate = "started"
  hagroup = "cl2-ha"
  onboot = "true"
  start = "true"
}
