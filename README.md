
[![docker hub version semver](https://img.shields.io/docker/v/sinlov/docker-python-poetry-gcc?sort=semver)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc/tags?page=1&ordering=last_updated)
[![docker hub image size](https://img.shields.io/docker/image-size/sinlov/docker-python-poetry-gcc)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc)
[![docker hub image pulls](https://img.shields.io/docker/pulls/sinlov/docker-python-poetry-gcc)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc/tags?page=1&ordering=last_updated)

[![GitHub license](https://img.shields.io/github/license/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc)
[![GitHub latest SemVer tag)](https://img.shields.io/github/v/tag/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc/tags)
[![GitHub release)](https://img.shields.io/github/v/release/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc/releases)

## Contributing

[![Contributor Covenant](https://img.shields.io/badge/contributor%20covenant-v1.4-ff69b4.svg)](.github/CONTRIBUTING_DOC/CODE_OF_CONDUCT.md)
[![GitHub contributors](https://img.shields.io/github/contributors/sinlov/docker-python-poetry-gcc)](https://github.com/sinlov/docker-python-poetry-gcc/graphs/contributors)

We welcome community contributions to this project.

Please read [Contributor Guide](.github/CONTRIBUTING_DOC/CONTRIBUTING.md) for more information on how to get started.

请阅读有关 [贡献者指南](.github/CONTRIBUTING_DOC/zh-CN/CONTRIBUTING.md) 以获取更多如何入门的信息


# docker-python-poetry-gcc

- docker hub see https://hub.docker.com/r/sinlov/docker-python-poetry-gcc

## for

- [https://hub.docker.com/r/fnndsc/python-poetry](https://hub.docker.com/r/fnndsc/python-poetry) add make and gcc for build

- [![](https://img.shields.io/docker/v/fnndsc/python-poetry?label=python-poetry&style=social)](https://hub.docker.com/r/fnndsc/python-poetry/tags) latest semver version

### env info

| image version | poetry version | python version | micromamba version | conda version |
| ------------- | -------------- | -------------- | ------------------ | ------------- |
| 1.5.1         | 1.5.1          | 3.11.4         | 1.4.8              |               |
| 1.4.1         | 1.4.1          | 3.11.2         |                    | 23.3.1        |
| 1.3.1-alpine  | 1.3.1          | 3.11.0         |                    | 22.11.1       |

- 1.5.1 use [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html#docker-images)
  - notice: docker user change to `uid=1000(mambauser) gid=1000(mambauser) groups=1000(mambauser)`

## source repo

[https://github.com/sinlov/docker-python-poetry-gcc](https://github.com/sinlov/docker-python-poetry-gcc)

## fast use

```sh
docker run --rm \
  --entrypoint poetry \
  --name "test-docker-python-poetry-gcc" \
  sinlov/docker-python-poetry-gcc:latest \
  --help
```
