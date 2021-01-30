CONFIG=$HOME/.config/yadm
export SYSTEM_TYPE=$(uname -s)

log_info(){
  tput bold
  tput setaf 6
  echo "> \c"
  tput setaf 5
  echo "$@"
  tput sgr0
}
