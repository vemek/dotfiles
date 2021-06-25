#!/bin/sh

. "$HOME/.config/yadm/util.sh"

STABLE_RUBY_VERSION="3.0.1"

if [ ! -d "$HOME/.rbenv" ]; then
  log_info "Installing rbenv"
  git clone https://github.com/rbenv/rbenv.git "$HOME/.rbenv"
  # source rbenv shell config. will be loaded by shell RC file on new shell
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  log_info "Installing ruby-build"
  git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
fi


log_info "Updating rbenv and ruby-build"
git -C "$HOME/.rbenv" pull
git -C "$HOME/.rbenv/plugins/ruby-build" pull

log_info "Install ruby version $STABLE_RUBY_VERSION"
rbenv install -v "$STABLE_RUBY_VERSION"
rbenv global "$STABLE_RUBY_VERSION"
