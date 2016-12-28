#!/bin/bash

# experiment 1: render asciidoc from pdf
#asciidoctor-pdf -a allow-uri-read aitm-collaborator-pdf.adoc

asciidoctor-pdf aitm-instructor-pdf.adoc

# experiment 2: asciidoc to docbook to latex to pdf

asciidoctor -b docbook aitm-instructor-pdf.adoc

# converts to latex only - essential for errors of kind Missing character &#x202f; - that
# is an error seen only in the tex file.

dblatex -t tex aitm-instructor-pdf.xml

# converts to pdf via latex
dblatex aitm-instructor-pdf.xml
# results are crap - no wrapping, graphics mis-sized.

# so, what to do now...
# end game: a presentable PDF on LeanPub
# need a narrower layout
# wrapped graphics

# OK< let's try publican - no Latex involved. 
