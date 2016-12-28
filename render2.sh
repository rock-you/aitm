#!/bin/bash

# experiment 1: render asciidoc from pdf
#asciidoctor-pdf -a allow-uri-read aitm-collaborator-pdf.adoc

asciidoctor-pdf aitm-instructor-pdf.adoc

# experiment 2: asciidoc to docbook to latex to pdf

asciidoctor -b docbook aitm-instructor-pdf.adoc

# converts to pdf via latex
dblatex aitm-instructor-pdf.xml


# converst to latex only
dblatex -t tex aitm-instructor-pdf.xml
