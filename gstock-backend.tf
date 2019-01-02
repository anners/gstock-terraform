# Reserve the static IP address for the BUY backend.
resource "google_compute_address" "backend_ip_address" {
  name = "backend-address"
  region = "${var.region}"
  project  = "${var.in_scope_cde_project_id}"
}


output "backend_ip_address"{
  value = "${google_compute_address.backend_ip_address.address}"
}
