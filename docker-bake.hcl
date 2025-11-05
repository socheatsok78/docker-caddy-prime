variable "CADDY_VERSION" {
  default = "2.10.2"
}

variable "GITHUB_SHA" {
  default = ""
}
variable "GITHUB_REPOSITORY" {
  default = "socheatsok78/docker-caddy-prime"
}
variable "GITHUB_REPOSITORY_OWNER" {
  default = "socheatsok78"
}

variable "created" {
  default = timestamp()
}
variable "description" {
  default = "A customized Caddy tailored for @socheatsok78"
}

target "docker-metadata-action" {
  annotations = [
    "manifest:org.opencontainers.image.description=${description}",
    "manifest:org.opencontainers.image.licenses=Apache 2.0",
    "manifest:org.opencontainers.image.revision=${GITHUB_SHA}",
    "manifest:org.opencontainers.image.source=https://github.com/${GITHUB_REPOSITORY}",
    "manifest:org.opencontainers.image.title=docker-caddy-prime",
    "manifest:org.opencontainers.image.url=https://github.com/${GITHUB_REPOSITORY}",
    "manifest:org.opencontainers.image.version=",
  ]
  labels = {
    "org.opencontainers.image.created": created,
    "org.opencontainers.image.description": description,
    "org.opencontainers.image.licenses": "Apache 2.0",
    "org.opencontainers.image.revision": GITHUB_SHA,
    "org.opencontainers.image.source": "https://github.com/${GITHUB_REPOSITORY}",
    "org.opencontainers.image.title": "docker-caddy-prime",
    "org.opencontainers.image.url": "https://github.com/${GITHUB_REPOSITORY}",
    "org.opencontainers.image.version": CADDY_VERSION
  }
}

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
