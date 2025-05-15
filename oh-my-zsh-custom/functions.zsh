function brewfiles() {
  echo "🔄 Updating Homebrew..."
  brew update

  echo "⬆️ Upgrading installed packages..."
  brew upgrade

  echo "📦 Installing from base/Brewfile..."
  if [[ -f ~/Dotfiles/brewfile/base/Brewfile ]]; then
    brew bundle --file=~/Dotfiles/brewfile/base/Brewfile
  else
    echo "⚠️ Brewfile not found!"
  fi

  echo "📦 Installing from developer/Brewfile..."
  if [[ -f ~/Dotfiles/brewfile/developer/Brewfile ]]; then
    brew bundle --file=~/Dotfiles/brewfile/developer/Brewfile
  else
    echo "⚠️ Brewfile not found!"
  fi

  echo "✅ All done!"
}

# Function to update and push dotfiles to the git repository
function pushdotfiles() {
  pushd ~/Dotfiles || { echo "Failed to enter ~/Dotfiles"; return 1 }

  # Check for any staged or unstaged changes
  if [[ -n "$(git status --porcelain)" ]]; then
    git commit -a -m "Update dotfiles"
    git push
  else
    echo "No changes to commit."
  fi

  popd
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
  python -m pip install --upgrade pip
  vrun "${name}"
}

function pipxfiles() {
  local file=~/.pipxfile

  if [[ ! -f "$file" ]]; then
    echo "Package list file '$file' not found!"
    return 1
  fi

  if ! command -v jq >/dev/null; then
    echo "jq is required for this script to work. Please install it first."
    return 1
  fi

  local installed
  installed=$(pipx list --json | jq -r '.venvs | keys[]' | tr '[:upper:]' '[:lower:]')

  while IFS= read -r package || [[ -n "$package" ]]; do
    [[ -z "$package" || "$package" == \#* ]] && continue

    local pkg_lc
    pkg_lc=$(echo "$package" | tr '[:upper:]' '[:lower:]')

    if echo "$installed" | grep -qx "$pkg_lc"; then
      echo "$package is already installed, skipping."
    else
      echo "Installing $package..."
      pipx install "$package"
    fi
  done < "$file"

  echo "All pipx packages processed!"
  pipx --quiet upgrade-all
  echo "All pipx packages updated!"
}

# Change to a temporary directory
function t () {
  cd "$(mktemp -d)"
}
