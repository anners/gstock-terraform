# Create App Engine instance to enable Datastore
resource "google_app_engine_application" "token_app" {
  project     = "${var.in_scope_cde_project_id}"
  location_id = "${var.location}"
}

# Create the Tokenization Service s KMS keyring.
resource "google_kms_key_ring" "token_key_ring" {
  name     = "token-keyring"
  location = "global"
  project  = "${var.in_scope_cde_project_id}"
}

# Create the Tokenization Service s KMS key.
resource "google_kms_crypto_key" "token_key" {
  name     = "token-key"
  key_ring = "${google_kms_key_ring.token_key_ring.id}"
}

# Grant the compute engine default service account
resource "google_kms_crypto_key_iam_binding" "token_key" {
  crypto_key_id = "${google_kms_crypto_key.token_key.self_link}"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:${var.in_scope_cde_project_number}-compute@developer.gserviceaccount.com",
  ]
}
