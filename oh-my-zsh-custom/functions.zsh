# Function to brew update, upgrade, and bundle files
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

# Function to show gcalcli agenda for today and tomorrow
function cald() {
  local today=$(date +%Y-%m-%d)
  # Compatibility for both macOS (BSD) and Linux (GNU) date commands
  local tomorrow=$(date -v+1d +%Y-%m-%d 2>/dev/null || date -d "tomorrow" +%Y-%m-%d)
  
  gcalcli agenda "$today" "$tomorrow"
}

# Function to update and upgrade CheckoutManager
function checkoutmanagerfiles() {
    echo "🔄 Updating CheckoutManager..."
    checkoutmanager co
    echo "⬆️ Upgrading CheckoutManager..."
    checkoutmanager up
}

# Custom mkv function to create a virtualenv with uv and activate it
function mkv () {
    local name="${1:-$PYTHON_VENV_NAME}" 
    local venvpath="${name:P}" 
    
    # Force uv to use the python version set by pyenv
    uv venv --python "$(pyenv which python)" "${name}" || return
    
    echo "Created venv in '${venvpath}' using $(python --version)" >&2
    
    vrun "${name}"
    python -m ensurepip
    
    pushd "${venvpath}/bin" > /dev/null && ln -sv pip3 ./pip && popd > /dev/null
    
    python -m pip install --upgrade pip
    vrun "${name}"
}

# Function to install global npm packages from a package.json file
function npmfiles() {
  local file=~/.package.json

  if [[ ! -f "$file" ]]; then
    echo "Error: $file not found."
    return 1
  fi

  # Extract dependency names using jq and install them globally
  echo "Extracting packages from $file..."
  
  local packages=$(jq -r '.dependencies, .devDependencies | keys[]' "$file" 2>/dev/null)

  if [[ -z "$packages" ]]; then
    echo "No dependencies found in $file."
    return 1
  fi

  echo "Installing: ${(f)packages}"
  npm install -g ${(f)packages}
}

# Function to process pipx packages from a manifest file
function pipxfiles() {
    local file=~/.pipxfile
    
    # 1. Validation Checks
    if [[ ! -f "$file" ]]; then
        echo "Error: Package list file '$file' not found!"
        return 1
    fi

    if ! command -v jq >/dev/null; then
        echo "Error: 'jq' is required. Install it with 'brew install jq' or your package manager."
        return 1
    fi

    # 2. Get currently installed packages into a Zsh Hash Map
    echo "Fetching currently installed pipx packages..."
    typeset -A installed_pkgs
    local pkg
    # Use (f) to split output by lines and :l to lowercase
    for pkg in ${(f)"$(pipx list --json | jq -r '.venvs | keys[]' 2>/dev/null)"}; do
        installed_pkgs[${pkg:l}]=1
    done

    # 3. Move to /tmp to avoid "path collision" errors (like the 'dotfiles' issue)
    pushd /tmp > /dev/null

    # 4. Process the manifest file
    while IFS= read -r package || [[ -n "$package" ]]; do
        # Trim leading/trailing whitespace
        package="${package#"${package%%[![:space:]]*}"}"
        package="${package%"${package##*[![:space:]]}"}"
        
        # Skip empty lines and comments
        [[ -z "$package" || "$package" == \#* ]] && continue

        local pkg_lc="${package:l}"

        if [[ -n "${installed_pkgs[$pkg_lc]}" ]]; then
            echo "--- Upgrading $package ---"
            pipx upgrade "$package"
        else
            echo "--- Installing $package ---"
            pipx install "$package"
        fi
    done < "$file"

    # 5. Return to original directory
    popd > /dev/null
    echo "\nAll pipx packages processed successfully!"
}

# Change to a temporary directory
function t () {
    cd "$(mktemp -d)"
}

# Function to update and push dotfiles to the git repository
function updatedotfiles() {
    pushd ~/Dotfiles || { echo "Failed to enter ~/Dotfiles"; return 1 }
    echo "🔄 Pulling dotfiles repository..." 
    git pull

    echo "🔄 Committing dotfiles repository..." 
    # Check for any staged or unstaged changes
    if [[ -n "$(git status --porcelain)" ]]; then
        git commit -a -m "Update dotfiles"
    else
        echo "No changes to commit."
    fi
    echo "🔄 Pushing dotfiles repository..." 
    # Check for any staged or unstaged changes
        git push
    popd
}
