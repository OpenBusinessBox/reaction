$(eval REMOTE_TAG := $(shell cat .remote.tag))
$(eval LOCAL_TAG := $(shell cat .local.tag))

all: build tag push

build:
	reaction build ${LOCAL_TAG}

tag:
	docker tag ${LOCAL_TAG} ${REMOTE_TAG}

push:
	docker push ${REMOTE_TAG}

serve:
	reaction
