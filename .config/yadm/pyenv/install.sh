#!/bin/sh

. "$HOME/.config/yadm/util.sh"

STABLE_PYTHON_VERSION="3.9.5"

if [ ! -d "$HOME/.pyenv" ]; then
  log_info "Installing pyenv"
  git clone https://github.com/pyenv/pyenv "$HOME/.pyenv"
  cd ~/.pyenv && src/configure && make -C src
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi


log_info "Updating pyenv"
git -C "$HOME/.pyenv" pull

log_info "Install python version $STABLE_PYTHON_VERSION"
pyenv install -v --skip-existing "$STABLE_PYTHON_VERSION"
pyenv global "$STABLE_PYTHON_VERSION"
