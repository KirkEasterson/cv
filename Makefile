CV=main.tex
OUT=main

all:
	rubber --pdf --jobname $(OUT) $(CV)

clean:
	rubber --clean $(CV)
	rm $(OUT).pdf
