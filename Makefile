SRC_DIR=./src/
BUILD_DIR=./build/
CV=$(SRC_DIR)template.typ
OUT=$(BUILD_DIR)cv.pdf

.PHONY: clean
clean:
	@mkdir -p $(BUILD_DIR)
	@rm -f $(OUT)

.PHONY: build
build: clean
	docker compose run --rm typst compile "$(CV)" "$(OUT)"

.PHONY: watch
watch: clean
	docker compose run --rm typst watch "$(CV)" "$(OUT)"

styles:
	docker compose run --rm vale sync

.PHONY: lint
lint: styles
	docker compose run --rm vale $(SRC_DIR)
