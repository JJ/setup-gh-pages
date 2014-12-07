#!/bin/bash

# inspired by http://stackoverflow.com/questions/14024594/how-do-i-prevent-the-github-pages-automatic-generator-to-remove-everything-bef 
# Please read README.md for instructions 
# Might error if _layout exists
cd .git/hooks
curl -L https://raw.githubusercontent.com/JJ/setup-gh-pages/master/sync.sh > post-commit
chmod +x post-commit
cd ../..
git checkout gh-pages
mkdir _layouts
perl -e '$_ = join("",<>);s/id="main_content">(.+)<\/section>/id="main_content">{{content}}<\/section>/sm;s/id="main_content" class="inner">(.+)<\/section>/ id="main_content" class="inner">{{content}}<\/section>/sm;print;' index.html 
echo -e "---\nlayout: index\n---\n" > index.md
echo "markdown: kramdown" > _config.yml
git add _config.yml index.md _layouts/index.html
git rm index.html
git commit -am "Done setup"

