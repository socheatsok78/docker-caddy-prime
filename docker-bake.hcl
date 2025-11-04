variable "CADDY_VERSION" {
  default = "2.10.2"
}

variable "GITHUB_REPOSITORY_OWNER" {
  default = "socheatsok78"
}

target "docker-metadata-action" {}

target "github-metadata-action" {}

target "default" {
  inherits = [ 
    "docker-metadata-action",
    "github-metadata-action",
]
  args = {
    CADDY_BUILDER_VERSION = regex("^(\\d+\\.\\d+)", CADDY_VERSION)[0]
    CADDY_VERSION = CADDY_VERSION
  }
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  tags = [
    "ghcr.io/${GITHUB_REPOSITORY_OWNER}/caddy-prime:${CADDY_VERSION}"
  ]
}
