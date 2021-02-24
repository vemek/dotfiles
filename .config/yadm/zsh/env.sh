source "$HOME/.config/yadm/util.sh"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  alias oldbrew='arch -x86_64 ~/homebrew-x86/bin/brew'
fi
