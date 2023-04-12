variable "project_name"{}
variable "vpc_name"{}
variable "subnet_name"{}
variable "vms" {}
variable "number" {}
variable "type" {}


resource "google_compute_network" "vpc" {
  project                 = var.project_name
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode     = "REGIONAL"
  enable_ula_internal_ipv6 = true
}


resource "google_compute_subnetwork" "subnetwork" {
  
  name          = var.subnet_name
  project       = var.project_name
  ip_cidr_range = "10.0.0.0/22"
  region        = "us-west2"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  network       = google_compute_network.vpc.name
}


resource "google_compute_instance" "default" {
  count = var.number
  project = var.project_name
  name         = "${var.vms}-${count.index}"
  machine_type = var.type
  zone         = "us-west2-a"

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnetwork.name
  }

}
