Set up `gh-pages`
==============

Sets up a repo after initial generation of [Github pages](http://pages.github.com) and adds a hook for syncing after initial setup.

## Before running

These couple of shell scripts use `curl`, `git`, `sed` and shell commands. They should be in any basic Linux or Mac installation that is already using GitHub, but if it's not, `sudo apt-get install curl` and whatever is not there.

## Instructions

1. Generate GitHub pages though the web interface.
2. `git pull && git checkout gh-pages`.
3. Download and run [`setup.sh`](setup.sh) or

```
curl -L https://raw.githubusercontent.com/JJ/setup-gh-pages/master/setup.sh  | bash
```

3. `cd .git/hooks`; download [`sync.sh`](sync.sh) and

```
chmod +x sync.sh
ln -s sync.sh post-commit
```

If your project includes other files, you'll have to adapt the hook file.

I have tested it on Slate, Merlot, Time Machine and Tactile. It might not work for some GH templates. If so, you'll have to go and edit `_layouts/index.html` and insert by hand `{{content}}` where you want your content to go. But please leave an issue in this repo and I'll try to fix it.
