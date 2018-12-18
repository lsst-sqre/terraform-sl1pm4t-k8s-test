module "gke" {
  source         = "git::https://github.com/lsst-sqre/terraform-gke-std.git//?ref=master"
  name           = "${local.gke_cluster_name}"
  google_project = "${var.google_project}"
  gke_version    = "latest"
}

provider "kubernetes" {
  version = "1.3.0-custom"

  load_config_file = true

  host                   = "${module.gke.host}"
  cluster_ca_certificate = "${base64decode(module.gke.cluster_ca_certificate)}"
}
