FILE=manuscript

all: $(FILE).pdf

.PHONY: clean
clean:
	\rm *.aux *.blg *.out *.bbl *.log *.dvi *.pdf biblio.bib

$(FILE).pdf: $(FILE).tex biblio.bib chapter_*/chapter_*.tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

biblio.bib:
	cat biblio_zotero.bib biblio_manuscript/chapter_1/biblio1.bib biblio_manuscript/chapter_3/biblio3.bib biblio_manuscript/chapter_4/biblio4.bib > biblio.bib
