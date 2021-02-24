lsh() {
  lxc exec $@ /bin/bash
}

lsh-all() {
  for container in $(lxc list -c n --format csv); do
    tput setaf 6
    echo "> $container"
    tput sgr0
    lxc exec $container $@
  done
}
