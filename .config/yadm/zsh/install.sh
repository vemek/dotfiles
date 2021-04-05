#!/bin/sh

. "$HOME/.config/yadm/util.sh"

log_info "Installing oh-my-zsh and powerlevel10k"

# oh my zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc # fix OMZ overwriting config
fi

# powerlevel10k theme
if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
else
  git -C $HOME/.oh-my-zsh/custom/themes/powerlevel10k pull
fi

