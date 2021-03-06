VERSION=latest
IMAGE=localgod/malachite:${VERSION}

.PHONY: build login push logout publish

login:
	@docker login -u ${USER} -p ${PASS}

logout:
	docker logout

push:
	docker push ${IMAGE}

publish: login build push logout

build:
	docker build -t ${IMAGE} .

console:
	docker run --name malachite -it ${IMAGE} /bin/bash

clean:
	docker rm -f malachite
	docker rmi -f "localgod/malachite"
