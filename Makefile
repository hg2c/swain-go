.PHONY: build
build:
	@./scripts/binary.sh

.PHONY: vendor
vendor:
	dep ensure

.PHONY: image
image:
	./scripts/image.sh

.PHONY: deploy-image
deploy-image:
	./scripts/deploy-image.sh
