
[![docker version semver](https://img.shields.io/docker/v/sinlov/docker-python-poetry-gcc?sort=semver)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc)
[![docker image size](https://img.shields.io/docker/image-size/sinlov/docker-python-poetry-gcc)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc)
[![docker pulls](https://img.shields.io/docker/pulls/sinlov/docker-python-poetry-gcc)](https://hub.docker.com/r/sinlov/docker-python-poetry-gcc/tags?page=1&ordering=last_updated)

# docker-python-poetry-gcc

- docker hub see https://hub.docker.com/r/sinlov/docker-python-poetry-gcc

## for

- [https://hub.docker.com/r/fnndsc/python-poetry](https://hub.docker.com/r/fnndsc/python-poetry) add make and gcc for build

- [![](https://img.shields.io/docker/v/fnndsc/python-poetry?label=python-poetry&style=social)](https://hub.docker.com/r/fnndsc/python-poetry/tags) latest semver version

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
