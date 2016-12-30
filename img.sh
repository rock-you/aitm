#!/bin/bash

sed -i -- 's/usepackage{makeidx}/usepackage{makeidx}\n\\usepackage{wrapfig}/g' $1
sed -i -- 's/begin{figure}/begin{wrapfigure}{r}{0.5\\textwidth}/g' $1
sed -i -- 's/end{figure}/end{wrapfigure}/g' $1
sed -i -- 's/width=.*,/width=0.48\\textwidth/g' $1
