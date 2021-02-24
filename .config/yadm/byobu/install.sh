#!/bin/sh

. "$HOME/.config/yadm/util.sh"

log_info "Installing byobu and configuring"

# Configure active network interface
ip r get 8.8.8.8 | head -n1 | sed 's/.*dev //' | sed 's/ src.*//' > "$HOME/.byobu/interface"

