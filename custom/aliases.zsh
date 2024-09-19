alias o="pypistats overall"
alias e="env | sort"
alias v="mkv"
alias vi="nvim"
alias s="vrun"

case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade && brew bundle install --file=~/.Brewfile"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y"
  ;;
esac
