#!/bin/bash

rm -f *.idx *.log *.aux *.bbl *.blg *.out *.toc *.lof *.lot *.glo *.cb *.cb2 *.tex-- *.txt--

NAME=`echo "$1" | cut -d'.' -f1`   #only one dot in the filename please

# asciidoc to docbook xml
asciidoctor -b docbook $NAME.adoc

# docbook to latex only - essential for errors of kind Missing character &#x202f; - that
# is an error seen only in the tex file:

#dblatex -t tex $NAME.xml  # default tex
dblatex -t tex -T simple $NAME.xml    #simple tex
#dblatex -t tex -T db2latex $NAME.xml  # another style

# docbook->pdf via latex no wrapping, graphics disregard sizing.
# dblatex aitm-collaborator-pdf.xml

# clean up images
./img.sh $NAME.tex

# or tex-pdf only, verbose
#pdflatex $NAME.tex  #2x for cites
#pdflatex $NAME.tex

rm -f *.idx *.log *.aux *.bbl *.blg *.out *.toc *.lof *.lot *.glo *.cb *.cb2


# asciidoc from pdf - no wrapping, little control
#asciidoctor-pdf -a allow-uri-read $NAME.adoc
#asciidoctor-pdf $NAME.adoc
