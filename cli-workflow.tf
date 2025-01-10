terraform {
  cloud {
    organization = "organization-name"

    workspaces {
      name = "remote-workspace"
    }
  }
}