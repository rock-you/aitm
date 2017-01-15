#!/bin/bash

MYLABEL="`perl -p -e 'BEGIN{undef $/;}
s|.*?image::images\/\d?\d_\d\d-(.*?)\..*?(\d{3}).*?\]|fig-$1-$2|msgx' $1`"

MYIMAGE="`perl -p -e 'BEGIN{undef $/;}
s|.*?(image::.*?\].*?)|$1|msgx' $1`"



if grep -q "left" $1; then
    #echo left
    XREF="`echo "<<$MYLABEL-i>>"`"
    BRAX="`echo "[[$MYLABEL-i]]"`"

elif grep -q "right" $1; then
    #echo right
    XREF="`echo "<<$MYLABEL-o>>"`"
    BRAX="`echo "[[$MYLABEL-o]]"`"
else
  XREF="`echo "<<$MYLABEL-c>>"`"
  BRAX="`echo "[[$MYLABEL-c]]"`"
fi

if grep -q "footnote" $1; then


    perl -p -e 'BEGIN{undef $/;}
    s|.*?footnote:\[_?(.*?)_?\].*|footnote:\[$1\]|msgx' $1 > tmp.txt

    FOOTNOTE="`perl -p -e 'BEGIN{undef $/;}
    s|image|Image|msgx' ./tmp.txt`"

    rm ./tmp.txt

    CAPTION="`perl -p -e 'BEGIN{undef $/;}
    s|(\.*?)footnote.*|$1|msgx' $1`"

    echo "(see "$XREF" "$FOOTNOTE")"
else
    echo "(see "$XREF")"

    CAPTION="`perl -p -e 'BEGIN{undef $/;}
    s|(\.*?)image.*|$1|msgx' $1`"

fi

echo
echo $BRAX
echo $CAPTION
echo $MYIMAGE



#s|.*?image::images\/\d?\d_\d\d-(.*?)\..*?(\d{3}).*?left.*?\]|fig-$1-$2-i|msgx' $1

#find label data & create new label
#extract out footnote
#remove _ from  footnote
