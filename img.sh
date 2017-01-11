#!/bin/bash

LC_ALL=C sed -i -- 's/usepackage{makeidx}/usepackage{makeidx}\
\\usepackage{wrapfig}/g' $1
LC_ALL=C sed -i -- 's/begin{figure}\[H\]/begin{wrapfigure}{r}{0.5\\textwidth}/g' $1
LC_ALL=C sed -i -- 's/end{figure}/end{wrapfigure}/g' $1
LC_ALL=C sed -i -- 's/width=.*,/width=0.48\\textwidth/g' $1


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

# search for 700317885 as pic index
