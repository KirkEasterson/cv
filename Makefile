SRC_DIR=./src/
BUILD_DIR=./build/
CV=$(SRC_DIR)main.typ
OUT=$(BUILD_DIR)main.pdf


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
