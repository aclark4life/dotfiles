alias b="gh browse"
alias df="df -h"
alias dj="django-mongodb-cli"
alias e="env | sort | tac"
alias ec2="aws ec2"
alias ev="evergreen"
alias fp="gpf"
alias j="just"
alias je="just -e"
alias jl="just -l"
alias k="ssh-keygen -t ed25519 -f ~/.ssh/id"
alias gc="git commit -a && git push"
alias gcl="git log -1 --pretty=%B | git commit -a -F - && git push"
alias gco="git checkout ."
alias gfp="gpf"
alias gsd="gh repo set-default"
alias gl="git log" 
alias i="pip install -U pip && pip install -r requirements.txt"
alias ml="mongo-launch"
alias mo="mongo-orchestration"
alias ms="mongosh"
alias o="pypistats overall"
alias op="open http://0.0.0.0:8000"
alias pipdeptree="uv tree"
alias pm="python manage.py"
alias v="mkv"
alias vi="nvim"
alias s="vrun"
alias se="python manage.py runserver 0.0.0.0:8000"
alias so="source ~/.zshrc"
alias st="gst"
alias ce="git commit -a && git push"

# Update repositories with `cm` function and update package managers with `brew` or `dnf`.
case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade && brew bundle install --file=~/.Brewfile && pipx_install_from_file && npm_install_global_from_file"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y && pipx_install_from_file"
  ;;
esac
