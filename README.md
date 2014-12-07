Set up `gh-pages`
==============

Sets up a repo after initial generation of [Github pages](http://pages.github.com) and adds a hook for syncing after initial setup.

## Before running

These couple of shell scripts use `curl`, `git`, `perl` and shell commands. They should be in any basic Linux or Mac installation that is already using GitHub, but if it's not, `sudo apt-get install curl perl` and whatever else is not there.

## Instructions

1. Generate GitHub pages though the web interface.
2. `git pull`.
3. Download and run [`setup.sh`](setup.sh) or do directly

```
curl -L https://raw.githubusercontent.com/JJ/setup-gh-pages/master/setup.sh  | bash
```

Finally, edit your `README.md` and commit to check the post-commit synchronization hook; push to publish the new version of the file.

If your project includes other files, you'll have to adapt the hook script.

I have tested it on Slate, Merlot, Time Machine, [Minimal](https://github.com/orderedlist/minimal) and Tactile. It might not work for some GH templates, since everyone uses different elements to include the content. If so, you'll have to go and edit `_layouts/index.html` and insert by hand `{{ "{{" }}content}}` where you want your content to go. But please leave an issue in this repo and I'll try to fix it, with a sample of the `index.html` that generated it.

## How does it work

It follows instructions in [this StackOverflow](http://stackoverflow.com/questions/14024594/how-do-i-prevent-the-github-pages-automatic-generator-to-remove-everything-bef) question to set up gh-pages and then adds a script, [`sync.sh`](sync.sh), as a post-commit hook in the `.git/hooks` directory.
