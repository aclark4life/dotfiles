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

function checkoutmanagerfiles() {
    echo "🔄 Updating CheckoutManager..."
    checkoutmanager co
    echo "⬆️ Upgrading CheckoutManager..."
    checkoutmanager up
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
          echo "Upgrading $package..."
          pipx upgrade "$package"
        else
          echo "Installing $package..."
          pipx install "$package"
        fi
    done < "$file"

    echo "All pipx packages processed!"
}

# Change to a temporary directory
function t () {
    cd "$(mktemp -d)"
}
