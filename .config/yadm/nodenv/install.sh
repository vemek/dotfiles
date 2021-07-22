#!/bin/sh

. "$HOME/.config/yadm/util.sh"

STABLE_NODE_VERSION="16.4.0"

if [ ! -d "$HOME/.nodenv" ]; then
  log_info "Installing nodenv"
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  cd ~/.nodenv && src/configure && make -C src
  export PATH="$HOME/.nodenv/bin:$PATH"
fi

if [ ! -d "$HOME/.nodenv/plugins/node-build" ]; then
  log_info "Installing node-build"
  git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
fi

log_info "Updating nodenv"
git -C "$HOME/.nodenv" pull
git -C "$HOME/.nodenv/plugins/node-build" pull

log_info "Install / upgrading yarn"
npm install --global yarn

log_info "Install node version $STABLE_NODE_VERSION"
nodenv install -v --skip-existing "$STABLE_NODE_VERSION"
nodenv global "$STABLE_NODE_VERSION"
