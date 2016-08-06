PAGES=$(wildcard *.md)

all: index.pdf

%.tex: %.md
	pandoc $*.md -r markdown_github -t latex -o $*.tex

index.pdf: $(PAGES:.md=.tex)
	./pdfpages.sh

clean:
	-rm *.tex

mrproper:
	-rm *.{pdf,tex,log,out,aux}
