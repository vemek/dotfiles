# misc
alias ls='ls --color'
alias tree='tree -C'
alias secpass='pwgen -y 24 1';

# ruby
alias be="bundle exec"
alias rake="be rake"
alias rails="be rails"
alias rspec="be rspec --format documentation --color"

# lxd
function lsh() {
  container="$1"
  exec="${2:-/bin/bash}"
  lxc exec "$container" $exec
}

function lsh-all() {
  exec="${@:-/bin/bash}"
  #for container in $(lxc list volatile.last_state.power=RUNNING -c n --format csv); do
  for container in $(lxc list -c n --format csv); do
    echo "$container: $exec"
    lxc exec "$container" $exec
  done
}
