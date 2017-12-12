FILE=manuscript

all: $(FILE).pdf

.PHONY: clean
clean:
	\rm *.aux *.blg *.out *.bbl *.log *.dvi *.pdf biblio.bib

$(FILE).pdf: $(FILE).tex biblio.bib chapter_*/chapter_*.tex appendix_a/appendix_a.tex
	pdflatex -shell-escape $(FILE)
	bibtex $(FILE)
	pdflatex -shell-escape $(FILE)
	pdflatex -shell-escape $(FILE)
	pdflatex -shell-escape $(FILE)

biblio.bib:
	cat biblio_zotero.bib biblio_manuscript/chapter_1/biblio1.bib biblio_manuscript/chapter_2/biblio2.bib biblio_manuscript/chapter_3/biblio3.bib biblio_manuscript/chapter_4/biblio4.bib biblio_manuscript/chapter_5/biblio5.bib biblio_manuscript/appendix_a/biblio_A.bib > biblio.bib
