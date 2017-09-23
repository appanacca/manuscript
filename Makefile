FILE=manuscript

all: $(FILE).pdf

.PHONY: clean
clean:
	\rm *.aux *.blg *.out *.bbl *.log *.dvi *.pdf

$(FILE).pdf: $(FILE).tex biblio.bib
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
