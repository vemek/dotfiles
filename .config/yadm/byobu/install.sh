#!/bin/sh

. "$HOME/.config/yadm/util.sh"

log_info "Installing byobu and configuring"

# Configure active network interface
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  route get 8.8.8.8 | grep interface | awk '{print $2}' > "$HOME/.byobu/interface"
else
  ip r get 8.8.8.8 | head -n1 | sed 's/.*dev //' | sed 's/ src.*//' > "$HOME/.byobu/interface"
fi
