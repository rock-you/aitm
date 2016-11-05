#!/bin/bash


# don't go running this thing without a thorough understanding.
# (well, it probably wouldn't hurt you, but it'll certainly blow up all over the place.)
# MUST be run from aitm dir
# this builds the book as html and pdf, and pushes to the working and pages repos in one command.
# pdf currently disabled.
# yes this is really tightly coupled to my workstations.
# (but runs well from both a Linux and a Mac Air, I
# switch between them at least once a day)
# I am using my "adoc" toolchain (stolen from Pro Git) as a basis.
# https://github.com/CharlesTBetz/adoc
# two peer repos @ same level, one "aitm" and one "aitm-pages"
# making this collaborative will need some help.

#build html
# bundle exec rake book:build

rm -rf images
mkdir images
#rewriting rakefile

# section-level images
yes|cp -P book/*/images/*.png images/
yes|cp -P book/*/images/*.jpg images/
# chapter-level images
yes|cp -P book/*/*/images/*.png images/
yes|cp -P book/*/*/images/*.jpg images/



#yes|cp  book/*/images/* images  # why book/**/ doesn't work?

asciidoctor aitm-student.adoc
asciidoctor aitm-instructor.adoc
asciidoctor aitm-collaborator.adoc

# asciidoctor-pdf -a allow-uri-read aitm-collaborator-pdf.adoc  #need to fix URI-based figures
# asciidoctor-epub3 aitm-student-epub.adoc
# asciidoctor-epub3 -a ebook-validate aitm-student-epub.adoc # with validation
# asciidoctor-epub3 -a ebook-format=kf8 aitm-student-epub.adoc
