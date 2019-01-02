resource "google_sql_database_instance" "gstock_master" {
  name             = "gstock-master-instance"
  database_version = "MYSQL_5_7"
  region           = "${var.region}"
  project          = "${var.in_scope_cde_project_id}"

  settings {
    tier = "db-f1-micro"

    location_preference {
      zone = "${var.region_zone}"
    }

    ip_configuration {
      ipv4_enabled = true

      # require_ssl = true
      authorized_networks = {
        name = "gstock-backend"
        value = "${google_compute_address.backend_ip_address.address}/32"
      }
    }
  }

  depends_on = ["google_compute_address.backend_ip_address"]
}
