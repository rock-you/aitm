# renaming file names from #.##-title.jpg|png to #_##-title.png|png

rename -v -n 's/(\d)\.(\d\d)/$1_$2/' *g

rename -v -n 's/3_09(.*)/5_04$1/' *.png




# then same thing within files but has to match *.png or *.jpg with no space
#1.01-blabla.jpg or .png
#(\b\d).(\d\d*.png) /$1_$2

sed -E -i .bak 's/([0-9])\.([0-9]{2}.*[png|jpg])/\1_\2/g' *.adoc

sed -E -i  's/3_09/5_04/g' *process.adoc

note: .bak is mac os variant
