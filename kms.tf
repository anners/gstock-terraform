resource "google_kms_key_ring" "gstock_key_ring" {
  name     = "gstock-keyring"
  location = "global"
  project  = "${var.in_scope_cde_project_id}"
}

resource "google_kms_crypto_key" "gstock_key" {
  name     = "gstock-key"
  key_ring = "${google_kms_key_ring.gstock_key_ring.id}"
}

resource "google_kms_crypto_key_iam_binding" "gstock_key" {
  crypto_key_id = "${google_kms_crypto_key.gstock_key.self_link}"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:${var.in_scope_cde_project_number}@cloudbuild.gserviceaccount.com",
  ]
}
