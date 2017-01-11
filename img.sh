#!/bin/bash

LC_ALL=C sed -i -- 's/usepackage{makeidx}/usepackage{makeidx}\
\\usepackage{wrapfig}/g' $1
LC_ALL=C sed -i -- 's/begin{figure}\[H\]/begin{wrapfigure}{r}{0.5\\textwidth}/g' $1
LC_ALL=C sed -i -- 's/end{figure}/end{wrapfigure}/g' $1
LC_ALL=C sed -i -- 's/width=.*,/width=0.48\\textwidth/g' $1