# Load the checkoutmanager configuration files found in ~/.config/checkoutmanager
function cm () {
  local cmd=$1
  local cfg=~/.config/checkoutmanager/checkoutmanager.cfg

  # Commit changes made in checkoutmanager directory
  pushd `dirname $cfg`; make > /dev/null 2>&1; popd

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
  vrun "${name}"
  python -m ensurepip
  pushd "${venvpath}/bin" > /dev/null && ln -sv pip3 ./pip && popd > /dev/null
  vrun "${name}"
}

# Function to install pipx packages from a file
pipx_install_from_file() {
  local file=~/.requirements.txt

  # Check if the file exists
  if [[ ! -f "$file" ]]; then
    echo "Package list file '$file' not found!"
    return 1
  fi

  # Install each package listed in the file
  while IFS= read -r package || [[ -n "$package" ]]; do
    # Skip empty lines or comments
    [[ -z "$package" || "$package" == \#* ]] && continue

    echo "Installing $package..."
    pipx install "$package"
  done < "$file"

  echo "All packages installed!"

  pipx upgrade-all

  echo "All packages updated!"
}

# Change to a temporary directory
function t () {
  cd "$(mktemp -d)"
}
