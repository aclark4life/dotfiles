# Custom mkv function to create a virtualenv with uv and activate it
function mkv () {
  local name="${1:-$PYTHON_VENV_NAME}" 
  local venvpath="${name:P}" 
  uv venv "${name}" || return
  echo "Created venv in '${venvpath}'" >&2
  vrun "${name}"
  python -m ensurepip
  pushd "${venvpath}/bin" > /dev/null && ln -sv pip3 ./pip && popd > /dev/null
  python -m pip install --upgrade pip
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

  echo "All pipx packages installed!"

  pipx --quiet upgrade-all

  echo "All pipx packages updated!"
}

# Function to install global npm packages from a file
npm_install_global_from_file() {
  local file=~/Dotfiles/package.json
  pushd `dirname $file` > /dev/null; npm install -g; popd
  echo "All npm packages installed!"
}

# Change to a temporary directory
function t () {
  cd "$(mktemp -d)"
}
