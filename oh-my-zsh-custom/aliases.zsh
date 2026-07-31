alias a="direnv allow"
alias b="gh browse"
alias calm="gcalcli calm"
alias calw="gcalcli calw"
alias ce="git commit -a && git push"
alias cm="checkoutmanager"
claude() {
  command claude --permission-mode auto "$@"
  local ret=$?
  # If no other claude processes remain running, clean up session history
  # (keeps settings.json, plugins, and memory outside these paths)
  if [[ $(pgrep -x claude 2>/dev/null | wc -l | tr -d ' ') -eq 0 ]]; then
    rm -rvf ~/.claude/projects/ ~/.claude/file-history/ ~/.claude/shell-snapshots/ ~/.claude/history.jsonl
  fi
  return $ret
}
copilot() {
  command copilot --allow-all-tools --add-dir /tmp "$@"
  local ret=$?
  # If no other copilot processes remain running, clean up ~/.copilot
  if [[ $(pgrep -x copilot 2>/dev/null | wc -l | tr -d ' ') -eq 0 ]]; then
    rm -rvf ~/.copilot/
  fi
  return $ret
}
alias df="duf"
alias e="env | sort | tail -r"
alias ec2="aws ec2"
alias ev="evergreen"
alias fp="git push --force-with-lease"
alias j="just"
alias je="just -e"
alias jl="just -l"
alias k="ssh-keygen -t ed25519 -f ~/.ssh/id"
alias g="glow -p"
alias ga="git commit --amend" 
alias gc="git commit -a && git push"
alias gcal="gcalcli"
alias gcl="git log -1 --pretty=%B | git commit -a -F - && git push"
alias gco="git checkout ."
alias gfp="gpf"
alias gsd="gh repo set-default"
alias gl="git log" 
alias ml="mongo-launch"
alias mo="mongo-orchestration"
alias ms="mongosh"
alias mutt="neomutt"
alias o="pypistats overall"
alias pg="/opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14"
alias v="mkv"
alias vi="nvim"
alias s="vrun"
alias so="source ~/.zshrc"
alias st="gst"
alias u="updatedotfiles && checkoutmanagerfiles && brewfiles && pipxfiles && npmfiles"
