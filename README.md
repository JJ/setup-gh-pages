Set up `gh-pages`
==============

Sets up a repo after initial generation of [Github pages](http://pages.github.com) and adds a hook for syncing after initial setup.

## Instructions

1. Generate GitHub pages though the web interface.
2. `git pull && git checkout gh-pages`.
3. Download and run [`setup.sh`](setup.sh) or
```
curl -L https://github.com/JJ/setup-gh-pages/blob/master/setup.sh | bash
```
3. `cd .git/hooks`; download [`sync.sh`](sync.sh) and
```
chmod +x sync.sh
ln -s sync.sh post-commit
```
