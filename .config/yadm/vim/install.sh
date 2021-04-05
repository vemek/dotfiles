#!/bin/sh

. "$HOME/.config/yadm/util.sh"

log_info "Updating vim plugins"
vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
