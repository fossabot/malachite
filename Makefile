VERSION=latest
IMAGE=localgod/malachite:${VERSION}

.PHONY: build login logout publish

login:
	docker login -u ${USER} -p ${PASS}

logout:
	docker logout

publish: login build logout
	docker push ${IMAGE}

build:
	docker build -t ${IMAGE} .
