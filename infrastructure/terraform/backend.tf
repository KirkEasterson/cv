terraform {
  cloud {
    organization = "kirkeasterson"
    hostname     = "app.terraform.io"

    workspaces {
      name = "cv"
    }
  }
}

