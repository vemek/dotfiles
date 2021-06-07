source "$HOME/.config/yadm/util.sh"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  brew86 () {
    arch -x86_64 ~/homebrew-x86/bin/"$1" ${@:2}
  }
fi
