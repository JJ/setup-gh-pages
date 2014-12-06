#!/bin/bash

# inspired by http://stackoverflow.com/questions/14024594/how-do-i-prevent-the-github-pages-automatic-generator-to-remove-everything-bef and http://www.cyberciti.biz/faq/sed-howto-remove-lines-paragraphs/
# Please read README.md for instructions 
# Might error if _layout exists
mkdir _layouts
sed '/id="main_content">/,/<\/section>/d' index.html > /tmp/temp
sed 's/<hr>/<hr>\n{{content}}/' /tmp/temp > _layouts/index.html
rm /tmp/temp
echo -e "---\nlayout: index\n---\n" > index.md
echo "markdown: kramdown" > _config.yml
git add _config.yml index.md _layouts/index.html
git rm index.html
git commit -am "Done setup"

