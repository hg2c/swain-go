.PHONY: build
build:
	@./scripts/binary.sh

.PHONY: vendor
vendor:
	dep ensure

.PHONY: image
image:
	./scripts/image.sh
