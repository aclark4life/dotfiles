# dotfiles

My personal dotfiles for macOS & Linux, managed with [dotfiles](https://pypi.org/project/dotfiles/) and installed via `pipx`.

## Installation

```console
$ pipx install dotfiles
$ git clone git@github.com:aclark4life/dotfiles.git ~/Dotfiles
$ dotfiles --link
```

Configuration for the `dotfiles` tool itself lives in [`dotfilesrc`](dotfilesrc), which points at `~/Dotfiles` and excludes files like `.git`, `README.md`, and `LICENSE.txt` from being symlinked.

## Contents

| Path | Purpose |
| --- | --- |
| `zshrc`, `zprofile` | Zsh shell configuration (Oh My Zsh, plugins, `PATH`) |
| `oh-my-zsh-custom/` | Custom Oh My Zsh aliases, functions, scripts, and variables |
| `gitconfig` | Git user identity |
| `inputrc` | Readline configuration |
| `pdbrc` | Python debugger configuration |
| `npmrc` | npm configuration |
| `package.json` | Manifest of global npm CLI tools |
| `pipxfile` | List of Python CLIs installed via `pipx` |
| `brewfile/` | Homebrew Bundle files (`base`, `developer`) |
| `checkoutmanager.cfg` | Repository list for [checkoutmanager](https://pypi.org/project/checkoutmanager/) |
| `config/gh`, `config/kitty`, `config/nvim` | App-specific configuration linked into `~/.config` |
| `nvm/` | Node Version Manager script overrides |
| `ssh/` | SSH client config, known hosts, and agent settings |
| `Finder/` | macOS `.inetloc`/`.rdp`/`.vncloc` shortcuts |
| `macos-system-preferences.sh` | Applies macOS system preference defaults (idempotent, safe to re-run) |
| `wallpaper-rotate.sh` | Rotates the desktop wallpaper via a LaunchAgent (macOS) |
| `terminal-background-color.scpt` | AppleScript to set Terminal background color (macOS) |

Most files (shell, Git, SSH, editor, and CLI tool configuration) work on both macOS and Linux. A few — `Finder/`, `macos-system-preferences.sh`, `wallpaper-rotate.sh`, and `terminal-background-color.scpt` — are macOS-specific.

`macos-system-preferences.sh` applies the settings documented in [aclark4life/setup](https://github.com/aclark4life/setup#macos-system-preferences), my broader machine setup repo.

## License

See [LICENSE.txt](LICENSE.txt).
