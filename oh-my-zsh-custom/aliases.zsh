alias b="gh browse"
alias e="env | sort | tac"
alias k="ssh-keygen -t ed25519 -f ~/.ssh/id"
alias ml="mongo-launch"
alias mo="mongo-orchestration"
alias ms="mongosh"
alias o="pypistats overall"
alias pipdeptree="uv tree"
alias v="mkv"
alias vi="nvim"
alias s="vrun"
alias st="gst"
alias fp="gpf"
alias gc="git commit -a && git push"

# Update repositories with `cm` function and update package managers with `brew` or `dnf`.
case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade && brew bundle install --file=~/.Brewfile && pipx_install_from_file"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y && pipx_install_from_file"
  ;;
esac