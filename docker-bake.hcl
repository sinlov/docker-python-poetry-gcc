variable "DEFAULT_TAG" {
  default = "docker-python-poetry-gcc:local"
}

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  tags = ["${DEFAULT_TAG}"]
}

// Default target if none specified
group "default" {
  targets = ["image-local"]
}

// this config use by `docker_bake_targets` most of time is `image-basic`
// https://docs.docker.com/build/bake/reference/#target
// show config as: docker buildx bake --print image-basic
target "image-basic" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "Dockerfile"
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
}

// this config use by `docker_bake_matrix_target_postfix` most of time is {targets}-all
// https://docs.docker.com/build/bake/reference/#target
// must check by parent image support multi-platform
// doc: https://docs.docker.com/reference/cli/docker/buildx/build/#platform
// most of can as: linux/amd64 linux/386 linux/arm64/v8 linux/arm/v7 linux/arm/v6 linux/ppc64le linux/s390x
// show config as: docker buildx bake --print image-basic-all
target "image-basic-all" {
  inherits = ["image-basic"]
  platforms = [
    "linux/amd64",
    "linux/ppc64le",
    "linux/arm64/v8"
  ]
}

target "image-alpine" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "build-alpine.dockerfile"
  tags = ["${DEFAULT_TAG}-alpine"]
}

// show config as: docker buildx bake --print image-alpine-all
target "image-alpine-all" {
  inherits = ["image-alpine"]
  platforms = [
    "linux/amd64",
    "linux/ppc64le",
    "linux/arm64/v8"
  ]
}