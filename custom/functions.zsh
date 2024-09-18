# Load the checkoutmanager configuration files found in ~/.config/checkoutmanager
function cm () {
  local cmd=$1

  if [ -z "$cmd" ]; then
    # Run checkoutmanager once with no arguments
    checkoutmanager
  else
    for cfg in ~/.config/checkoutmanager/*.cfg; do
      [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
    done

    for cfg in ~/.checkoutmanager/*.cfg; do
      [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
    done
  fi
}

# Custom mkv function to create a virtualenv with uv and activate it
function mkv () {
  local name="${1:-$PYTHON_VENV_NAME}" 
  local venvpath="${name:P}" 
  uv venv "${name}" || return
  echo "Created venv in '${venvpath}'" >&2
  vrun "${name}"
  python -m ensurepip
}

# Change to a temporary directory
function t () {
  cd "$(mktemp -d)"
}
