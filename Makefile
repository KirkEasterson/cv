SRC_DIR=./src/
BUILD_DIR=./build/
CV=$(SRC_DIR)template.typ
OUT=$(BUILD_DIR)cv.pdf

.PHONY: clean
clean:
	rm -f $(OUT)

.PHONY: build
build: clean
	mkdir -p $(BUILD_DIR)
	docker compose run --rm typst compile "$(CV)" "$(OUT)"

.PHONY: watch
watch: clean
	mkdir -p $(BUILD_DIR)
	docker compose run --rm typst watch "$(CV)" "$(OUT)"

styles:
	mkdir -p styles
	docker compose run --rm -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u $(shell id -u) vale sync

.PHONY: lint
lint: styles
	docker compose run --rm vale $(SRC_DIR)
