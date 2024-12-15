SRC_DIR=./src/
CV=$(SRC_DIR)main.tex
OUT=$(SRC_DIR)main

all:
	rubber --pdf --force --jobname $(OUT) $(CV)

clean:
	rubber --clean $(CV)
	rm $(OUT).pdf

watch:
	while true; do \
		$(MAKE) $(WATCHMAKE); \
		inotifywait -qe close_write "./src/" --include ".*\.tex"; \
	done
