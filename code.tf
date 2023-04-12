resource "google_compute_network" "vpc-assignment14" {
  project                 = "pn-project-374416"
  name                    = "vpc-assignment14"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode     = "REGIONAL"
  enable_ula_internal_ipv6 = true
}

resource "google_compute_subnetwork" "subnetwork-assignment14" {
  name          = "subnetwork-assignment14"
  project       = "pn-project-374416"
  ip_cidr_range = "10.0.0.0/22"
  region        = "us-west2"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  network       = "vpc-assignment14"
}

variable "vms"{
  default = "vm-assignment14"
}

resource "google_compute_instance" "default" {
  count = 2
  project = "pn-project-374416"
  name         = "${var.vms}-${count.index}"
  machine_type = "e2-medium"
  zone         = "us-west2-a"

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "vpc-assignment14"
    subnetwork = "subnetwork-assignment14"
  }

}
