#!/bin/bash

mkdir -p "$HOME/src" && cd "$HOME/src"

# vemek
git clone git@github.com:vemek/miscellaneous vemek/miscellaneous
git clone git@github.com:vemek/vemek.github.io vemek/vemek.github.io

# solarized
git clone https://github.com/seebi/dircolors-solarized util/dircolors-solarized

# git
git clone https://github.com/so-fancy/diff-so-fancy util/diff-so-fancy
git clone https://github.com/magicmonty/bash-git-prompt util/bash-git-prompt
