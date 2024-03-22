
[![ci](https://github.com/sinlov/docker-python-poetry-gcc/actions/workflows/ci.yml/badge.svg)](https://github.com/sinlov/docker-python-poetry-gcc/actions/workflows/ci.yml)

[![GitHub license](https://img.shields.io/github/license/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc)
[![GitHub latest SemVer tag)](https://img.shields.io/github/v/tag/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc/tags)
[![GitHub release)](https://img.shields.io/github/v/release/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc/releases)

## Contributing

[![Contributor Covenant](https://img.shields.io/badge/contributor%20covenant-v1.4-ff69b4.svg)](.github/CONTRIBUTING_DOC/CODE_OF_CONDUCT.md)
[![GitHub contributors](https://img.shields.io/github/contributors/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc/graphs/contributors)

We welcome community contributions to this project.

Please read [Contributor Guide](.github/CONTRIBUTING_DOC/CONTRIBUTING.md) for more information on how to get started.

# docker usage

[![docker hub version semver](https://img.shields.io/docker/v/sinlov/docker-python-poetry-gcc?sort=semver)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc/tags?page=1&ordering=last_updated)
[![docker hub image size](https://img.shields.io/docker/image-size/sinlov/docker-python-poetry-gcc)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc)
[![docker hub image pulls](https://img.shields.io/docker/pulls/sinlov/docker-python-poetry-gcc)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc/tags?page=1&ordering=last_updated)

## docker-python-poetry-gcc

- docker hub see https://hub.docker.com/r/sinlov/docker-python-poetry-gcc

## for

- from [https://hub.docker.com/r/fnndsc/python-poetry](https://hub.docker.com/r/fnndsc/python-poetry)
- [![](https://img.shields.io/docker/v/fnndsc/python-poetry?label=python-poetry&style=social)](https://hub.docker.com/r/fnndsc/python-poetry/tags) latest semver version
- add kit
  - make
  - gcc

### env info

| image version | poetry version | python version | [micromamba](https://mamba.readthedocs.io/en/latest/index.html) version | [conda](https://docs.conda.io/en/latest/) version |
| ------------- | -------------- | -------------- | ------------------ | ------------- |
| 1.7.1         | 1.7.1          | 3.12.1         | 1.4.9              |               |
| 1.5.1         | 1.5.1          | 3.11.4         | 1.4.8              |               |
| 1.4.1         | 1.4.1          | 3.11.2         |                    | 23.3.1        |
| 1.3.1-alpine  | 1.3.1          | 3.11.0         |                    | 22.11.1       |

- 1.5.1 use [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html#docker-images)
  - notice: docker user change to `uid=1000(mambauser) gid=1000(mambauser) groups=1000(mambauser)`

## fast use

```sh
docker run --rm \
  --entrypoint poetry \
  --name "test-docker-python-poetry-gcc" \
  sinlov/docker-python-poetry-gcc:latest \
  --help
```
