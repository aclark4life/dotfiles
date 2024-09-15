alias o="pypistats overall"
alias e="env | sort"
alias v="mkv"
alias s="vrun"

case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y"
  ;;
esac

t () {
  cd "$(mktemp -d)"
}
