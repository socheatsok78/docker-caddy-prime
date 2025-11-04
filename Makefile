it: print build
print:
	docker buildx bake --print
build:
	docker buildx bake --set="*.platform=" --load
publish:
	docker buildx bake --push
