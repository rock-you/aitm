# renaming file names
rename -v -n 's/first dot/underscore/' *.png


  rename -v -n 's/(\d)\.(\d\d)/$1_$2/' *.png

# then same thing within files but has to match *.png or *.jpg with no space
#1.01-blabla.jpg or .png
#(\b\d).(\d\d*.png) /$1_$2

sed -E -e 's/([0-9])\.([0-9]{2}.*[png|jpg])/\1_\2/g' test.adoc

sed -E 's/([0-9])\.([0-9]{2}.*[png|jpg])/\1_\2/g' *.adoc
sed -E -i bak 's/([0-9])\.([0-9]{2}.*[png|jpg])/\1_\2/g' *.adoc
