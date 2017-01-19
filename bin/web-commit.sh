#!/bin/bash

cp ~/repos/aitm/web/*.html ~/repos/aitm-pages

git add . -A && git commit -m "commit"
git push origin gh-pages
