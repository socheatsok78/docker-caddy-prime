.EXPORT_ALL_VARIABLES:
GITHUB_SHA ?= $(shell git rev-parse HEAD)

it: build
build:
	docker buildx bake --print dev
	docker buildx bake --set="*.platform=" --load dev
publish:
	docker buildx bake --print
	docker buildx bake --push
list-modules:
	docker run --rm -it $(shell docker buildx bake --print | jq -cr '.target.default.tags[]') caddy list-modules
