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

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
