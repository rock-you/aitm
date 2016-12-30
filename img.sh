#!/bin/bash

sed 's/begin{figure}/begin{wrapfigure}{r}{0.5\\textwidth}/g' $1 | sed 's/end{figure}/end{wrapfigure}/g' | sed -r 's/width=.*,/width=0.48\\textwidth/g' > out.tex
