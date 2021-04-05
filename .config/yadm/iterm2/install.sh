#!/bin/sh

. "$HOME/.config/yadm/util.sh"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  log_info "Configuring iTerm2"
  defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.config/iterm2"
fi
