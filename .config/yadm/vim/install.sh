#!/bin/sh

. "$HOME/.config/yadm/util.sh"

log_info "Updating vim plugins"
vim '+PlugInstall' '+PlugClean!' '+PlugUpdate' '+qall'
