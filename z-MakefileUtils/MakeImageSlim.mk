# this file must use as base MakeImage.mk
# need install slim by https://github.com/slimtoolkit/slim#installation
# need var:
# ROOT_NAME is this project name
# ROOT_OWNER is this project owner
# INFO_BUILD_DOCKER_FROM_IMAGE for image running
# INFO_TEST_BUILD_DOCKER_PARENT_IMAGE for image local build
# INFO_BUILD_DOCKER_FILE for build docker image default Dockerfile
# INFO_TEST_BUILD_DOCKER_FILE for local build docker image file
# INFO_TEST_BUILD_DOCKER_PARENT_IMAGE for local build
# ROOT_PARENT_SWITCH_TAG is change parent image tag

ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME=${ENV_INFO_TEST_TAG_BUILD_DOCKER_CONTAINER_NAME}-slim
ENV_INFO_BUILD_DOCKER_IMAGE_SLIM_TAG=.slim

dockerSlimEnv: dockerEnv
	@echo "== dockerSlim env print start"
	@echo "install slim by https://github.com/slimtoolkit/slim#installation"
	@echo ""
	@slim --version
	@echo ""
	@echo "ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME      ${ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME}"
	@echo ""
	@echo "== dockerSlim env print end"
	@echo ""

dockerSlimXray: dockerTestBuildLatest
	slim xray ${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG}

dockerSlimTestBuild: dockerSlimTestRmLatest dockerSlimTestRmiLatest
	slim build \
	--target ${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG} \
	--tag ${ENV_INFO_BUILD_DOCKER_IMAGE_SLIM_TAG} \
	--pull --show-plogs \
	--http-probe=false
$(warning you can change test docker slim args at here for dev like:)
$(info --include-path /usr/)
$(info --include-path /bin/)
$(info docker slim target ${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG})

dockerSlimTestRunLatest:
	docker image inspect --format='{{ .Created}}' ${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG}${ENV_INFO_BUILD_DOCKER_IMAGE_SLIM_TAG}
	$(warning you can change test docker run args at here for dev)
	-docker run --rm --name ${ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME} \
	-e RUN_MODE=dev \
	${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG}${ENV_INFO_BUILD_DOCKER_IMAGE_SLIM_TAG}
	$(info for inner check can use like this)
	$(info docker run -it -d --entrypoint /bin/sh --name ${ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME} ${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG}${ENV_INFO_BUILD_DOCKER_IMAGE_SLIM_TAG})
	-docker inspect --format='{{ .State.Status}}' ${ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME}

dockerSlimTestRmLatest:
	-docker rm -f ${ENV_INFO_TEST_TAG_BUILD_DOCKER_SLIM_CONTAINER_NAME}

dockerSlimTestRmiLatest:
	-docker rmi -f ${ENV_INFO_BUILD_DOCKER_SOURCE_IMAGE}:${ENV_INFO_BUILD_DOCKER_TAG}${ENV_INFO_BUILD_DOCKER_IMAGE_SLIM_TAG}

helpDockerSlim:
	@echo "=== this make file can include MakeDocker.mk then use"
	@echo "- must has file: [ ${ENV_INFO_BUILD_DOCKER_FILE} ${ENV_INFO_TEST_BUILD_DOCKER_FILE}" ]
	@echo "- then change tag as:                       INFO_BUILD_DOCKER_TAG"
	@echo "- then change repository as:                INFO_REPOSITORY"
	@echo "- then change owner as:                     INFO_OWNER"
	@echo "- then change private docker repository as: INFO_PRIVATE_DOCKER_REGISTRY"
	@echo "- then change build parent image as:        INFO_TEST_BUILD_PARENT_IMAGE"
	@echo "- then change build image as:               INFO_BUILD_FROM_IMAGE"
	@echo "- check by task"
	@echo "$$ make dockerSlimEnv"
	@echo ""
	@echo "- first show the container image and reverse engineer its Dockerfile"
	@echo "$$ make dockerSlimXray"
	@echo ""
	@echo ""