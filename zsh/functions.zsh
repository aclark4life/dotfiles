# Load the checkoutmanager configuration files found in ~/.config/checkoutmanager
function cm () {
  local cmd=$1
  local cfg=~/.config/checkoutmanager/checkoutmanager.cfg

  # Commit changes made in checkoutmanager directory
  pushd `dirname $cfg`; make; popd

  if [ -z "$cmd" ]; then
    # Run checkoutmanager once with no arguments
    checkoutmanager
  else
    # Run checkoutmanager with arguments
    checkoutmanager "$cmd"
    # Run checkoutmanager with arguments and -c $cfg
    [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
  fi
}

# Custom mkv function to create a virtualenv with uv and activate it
function mkv () {
  local name="${1:-$PYTHON_VENV_NAME}" 
  local venvpath="${name:P}" 
  uv venv "${name}" || return
  echo "Created venv in '${venvpath}'" >&2
  python -m ensurepip
  pushd "${venvpath}/bin" > /dev/null && ln -sv pip3 ./pip && popd > /dev/null
  vrun "${name}"
}

# Change to a temporary directory
function t () {
  cd "$(mktemp -d)"
}
