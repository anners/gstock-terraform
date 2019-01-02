/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
provider "google" {
  region = "${var.region}"
}

variable "in_scope_cde_project_number" {
  default = "1090930279403"
}

variable "in_scope_cde_project_id" {
  default = "in-scope-cde-dfe87325d4b52d59"
}

variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-f"
}
