#!/bin/bash

cp ~/repos/aitm/web/*.html ~/repos/aitm-pages/test/
cp ~/repos/aitm/web/*.js ~/repos/aitm-pages/test


cd ~/repos/aitm-pages

git add . -A && git commit -m "commit"

git push origin gh-pages
