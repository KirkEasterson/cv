CV=main.tex
OUT=main

all:
	rubber --pdf --force --jobname $(OUT) $(CV)

clean:
	rubber --clean $(CV)
	rm $(OUT).pdf
