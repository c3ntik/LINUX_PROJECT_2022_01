resource "yandex_compute_instance" "sql02" {
  name                      = "sql02"
  hostname                  = "sql02"
  allow_stopping_for_update = true

  resources {
    cores         = "2"
    memory        = "2"
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = "10"
      type     = "network-ssd"
      name     = "sql02-ssd"
    }
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "10.10.10.62"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
