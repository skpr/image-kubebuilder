#!/usr/bin/make -f

REGISTRY=skpr/clamav
ARCH=amd64
VERSION_TAG=v2

build:
	docker build -t ${REGISTRY}:${VERSION_TAG}-${ARCH} .

push:
	docker push ${REGISTRY}:${VERSION_TAG}-${ARCH}

manifest:
	docker manifest create ${REGISTRY}:${VERSION_TAG} --amend ${REGISTRY}:${VERSION_TAG}-arm64 --amend ${REGISTRY}:${VERSION_TAG}-amd64
	docker manifest push ${REGISTRY}:${VERSION_TAG}

.PHONY: *
