#!/bin/bash

# experiment 1: render asciidoc from pdf
#asciidoctor-pdf -a allow-uri-read aitm-collaborator-pdf.adoc
asciidoctor-pdf aitm-instructor-pdf.adoc
# no wrapping, little control

# experiment 2: asciidoc to docbook xml
asciidoctor -b docbook aitm-instructor-pdf.adoc

# converts docbook to latex only - essential for errors of kind Missing character &#x202f; - that
# is an error seen only in the tex file:
dblatex -t tex aitm-instructor-pdf.xml

# xml-tex-pdf
dblatex aitm-instructor-pdf.xml
# no wrapping, graphics disregard sizing.

# or tex-pdf only, verbose
pdflatex aitm-instructor-pdf.tex

# so, what to do now...
# end game: a presentable PDF on LeanPub
# need a narrower layout
# wrapped graphics
