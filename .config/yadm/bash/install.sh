#!/bin/sh

. "$HOME/.config/yadm/util.sh"

log_info "Installing bash and prompt utils"

# Clone utility repos
mkdir -p "$HOME/src/util"

if [ ! -d "$HOME/src/util/bash-git-prompt" ]; then
  git clone https://github.com/magicmonty/bash-git-prompt "$HOME/src/util/bash-git-prompt"
fi

if [ ! -d "$HOME/src/util/dircolors-solarized" ]; then
  git clone https://github.com/seebi/dircolors-solarized  "$HOME/src/util/dircolors-solarized"
fi
