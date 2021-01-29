#!/bin/sh

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  brew install bash
fi

# Clone utility repos
mkdir -p "$HOME/src/util"
git clone https://github.com/magicmonty/bash-git-prompt "$HOME/src/util/bash-git-prompt"
git clone https://github.com/seebi/dircolors-solarized  "$HOME/src/util/dircolors-solarized"
