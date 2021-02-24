#!/bin/sh

. "$HOME/.config/yadm/util.sh"

if [ ! -d "$HOME/.rbenv" ]; then
  log_info "Installing rbenv"
  git clone https://github.com/rbenv/rbenv.git "$HOME/.rbenv"
fi

if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  log_info "Installing ruby-build"
  git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
fi


log_info "Updating rbenv and ruby-build"
git -C "$HOME/.rbenv" pull
git -C "$HOME/.rbenv/plugins/ruby-build" pull
