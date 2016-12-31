#!/bin/bash

# experiment 1: render asciidoc from pdf
#asciidoctor-pdf -a allow-uri-read aitm-collaborator-pdf.adoc
#asciidoctor-pdf aitm-instructor-pdf.adoc
# no wrapping, little control

rm -f *.idx *.log *.aux *.bbl *.blg *.out *.toc *.lof *.lot *.glo *.cb *.cb2

# experiment 2: asciidoc to docbook xml
asciidoctor -b docbook aitm-collaborator-pdf.adoc

# converts docbook to latex only - essential for errors of kind Missing character &#x202f; - that
# is an error seen only in the tex file:
#dblatex -t tex -T simple aitm-collaborator-pdf.xml
dblatex -t tex aitm-collaborator-pdf.xml

# dblatex -t tex  aitm-test-pdf.xml

# dblatex -t tex -T db2latex aitm-test-pdf.xml

# xml-tex-pdf
#dblatex aitm-collaborator-pdf.xml
# no wrapping, graphics disregard sizing.

./img.sh aitm-collaborator-pdf.tex

# or tex-pdf only, verbose
pdflatex aitm-collaborator-pdf.tex

pdflatex aitm-collaborator-pdf.tex

rm -f *.idx *.log *.aux *.bbl *.blg *.out *.toc *.lof *.lot *.glo *.cb *.cb2


# search for 700317885 as pic index

# so, what to do now...
# end game: a presentable PDF on LeanPub
# need a narrower layout
# wrapped graphics


# before
#
# \begin{figure}
#
# \begin{center}
# \imgexists{images/1_01c-women.png}{{\imgevalsize{images/1_01c-women.png}{\includegraphics[width=450pt,]{images/1_01c-women.png}}}}{women w/cell phones}
# \end{center}
# \caption[{Dinner out tonight? }]{Dinner out tonight? \footnotemark{}}
# \label{women.png-450-r}\hyperlabel{women.png-450-r}%
# \end{figure}
#
# after
#
# \begin{wrapfigure}{r}{0.5\textwidth}
#   \begin{center}
#     \includegraphics[width=0.48\textwidth]{images/1_01c-women.jpg}
#   \end{center}
#   \caption{Dinner out tonight?}
# \end{wrapfigure}
