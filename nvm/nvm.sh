case `uname` in
    Darwin)
	# $NVM_DIR should be "$HOME/.nvm" by default to avoid user-installed nodes destroyed every update
	[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
	\. /opt/homebrew/Cellar/nvm/0.40.1/libexec/nvm.sh
	# "nvm exec" and certain 3rd party scripts expect "nvm.sh" and "nvm-exec" to exist under $NVM_DIR
	[ -e "$NVM_DIR" ] || mkdir -p "$NVM_DIR"
	[ -e "$NVM_DIR/nvm.sh" ] || ln -s /opt/homebrew/opt/nvm/libexec/nvm.sh "$NVM_DIR/nvm.sh"
	[ -e "$NVM_DIR/nvm-exec" ] || ln -s /opt/homebrew/opt/nvm/libexec/nvm-exec "$NVM_DIR/nvm-exec"
    ;;
esac
