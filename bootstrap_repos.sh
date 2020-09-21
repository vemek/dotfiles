#!/bin/bash

set -ue

mkdir -p "$HOME/src/util"

cd "$HOME/src"

# vemek
git clone https://github.com/vemek/miscellaneous vemek/miscellaneous
git clone https://github.com/vemek/vemek.github.io vemek/vemek.github.io

cd "util"

# solarized
git clone https://github.com/seebi/dircolors-solarized util/dircolors-solarized

# git
git clone https://github.com/so-fancy/diff-so-fancy
git clone https://github.com/magicmonty/bash-git-prompt
