$(eval REMOTE_TAG := $(shell cat .remote.tag))
$(eval LOCAL_TAG := $(shell cat .local.tag))
TOOL_NODE_FLAGS="--max-old-space-size=14096"
BUILD_ARGS=--build-arg TOOL_NODE_FLAGS=$(TOOL_NODE_FLAGS)

all: build tag push

build:
	reaction build $(BUILD_ARGS) ${LOCAL_TAG}

tag:
	docker tag ${LOCAL_TAG} ${REMOTE_TAG}

push:
	docker push ${REMOTE_TAG}

serve:
	reaction
