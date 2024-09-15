export PATH="$PATH:`pwd`/.local/bin"
case `uname` in
  Darwin)
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac
case `uname` in
  Linux)
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  ;;
esac
