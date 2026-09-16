# dotfiles

> "My dotfiles are public!" —Alex

- Managed with [dotfiles](https://github.com/jbernard/dotfiles).
- Used by [setup](https://github.com/aclark4life/setup).

## Table of Contents

- [Tree](#tree)
- [Files and directories](#files-and-directories)
- **Description**
  - [Checkout Manager](#checkout-manager)
  - [Just](#just)
  - [MongoDB](#mongodb)
  - [Oh My ZSH](#ohmyzsh)
  - [Python](#python)

## Tree

```
.
├── .gitignore
├── brewfile
│   ├── base
│   │   └── Brewfile
│   └── developer
│       └── Brewfile
├── checkoutmanager.cfg
├── config
│   ├── kitty
│   │   └── kitty.conf
│   └── nvim
│       └── init.lua
├── dotfilesrc
├── Finder
│   ├── server.inetloc
│   ├── server.rdp
│   └── server.vncloc
├── gitconfig
├── inputrc
├── justfile
├── LICENSE.txt
├── macos-system-preferences.sh
├── npmrc
├── nvm
│   └── nvm.sh
├── oh-my-zsh-custom
│   ├── aliases.zsh
│   ├── functions.zsh
│   ├── scripts.zsh
│   └── variables.zsh
├── package.json
├── pdbrc
├── pipxfile
├── README.md
├── ssh
│   └── config
├── terminal-background-color.scpt
├── wallpaper-rotate.sh
├── zprofile
└── zshrc

10 directories, 30 files
```

## Files and directories

| Entry | Description |
|---|---|
| [`LICENSE.txt`](https://github.com/aclark4life/dotfiles/blob/main/LICENSE.txt) | Ye Olde [MIT License](https://opensource.org/license/mit). |
| [`README.md`](https://github.com/aclark4life/dotfiles/blob/main/README.md) | This file. |
| [`brewfile/`](https://github.com/aclark4life/dotfiles/blob/main/brewfile) | `base/Brewfile` + `developer/Brewfile`; installed via the `u` alias → `brewfiles` function. |
| [`checkoutmanager.cfg`](https://github.com/aclark4life/dotfiles/blob/main/checkoutmanager.cfg) | Repos managed by [checkoutmanager](https://github.com/reinout/checkoutmanager). |
| [`config/`](https://github.com/aclark4life/dotfiles/blob/main/config) | `nvim/init.lua` (mouse off, tabs) and `kitty/kitty.conf`. |
| [`dotfilesrc`](https://github.com/aclark4life/dotfiles/blob/main/dotfilesrc) | Config for the [dotfiles](https://github.com/jbernard/dotfiles) tool itself. |
| [`Finder/`](https://github.com/aclark4life/dotfiles/blob/main/Finder) | macOS Finder shortcuts to launch server connections. |
| [`gitconfig`](https://github.com/aclark4life/dotfiles/blob/main/gitconfig) | Global git `user.name`/`user.email`; symlinked to `~/.gitconfig`. |
| [`inputrc`](https://github.com/aclark4life/dotfiles/blob/main/inputrc) | `vi` keybindings for Readline in the Python interpreter. |
| [`justfile`](https://github.com/aclark4life/dotfiles/blob/main/justfile) | [just](https://github.com/casey/just) recipes; replaces the old `Makefile`. Run via `j`/`je`/`jl`. |
| [`macos-system-preferences.sh`](https://github.com/aclark4life/dotfiles/blob/main/macos-system-preferences.sh) | Applies macOS system prefs; aliased to `macprefs`. |
| [`npmrc`](https://github.com/aclark4life/dotfiles/blob/main/npmrc) | Allow post-install scripts for specific packages. |
| [`nvm/`](https://github.com/aclark4life/dotfiles/blob/main/nvm) | [Node Version Manager](https://github.com/nvm-sh/nvm) config. |
| [`oh-my-zsh-custom/`](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom) | `aliases.zsh`, `functions.zsh`, `scripts.zsh`, `variables.zsh`. |
| [`package.json`](https://github.com/aclark4life/dotfiles/blob/main/package.json) | Global npm CLI tools manifest, installed via `npmfiles`. |
| [`pdbrc`](https://github.com/aclark4life/dotfiles/blob/main/pdbrc) | `vi` keybindings in `pdb`. |
| [`pipxfile`](https://github.com/aclark4life/dotfiles/blob/main/pipxfile) | pipx package list, installed/updated via the `u` alias. |
| [`ssh/`](https://github.com/aclark4life/dotfiles/blob/main/ssh) | ssh config (identity per host). |
| [`terminal-background-color.scpt`](https://github.com/aclark4life/dotfiles/blob/main/terminal-background-color.scpt) | Picks a random theme for Terminal.app. |
| [`wallpaper-rotate.sh`](https://github.com/aclark4life/dotfiles/blob/main/wallpaper-rotate.sh) | Hourly wallpaper rotation, installed as a LaunchAgent by `macos-system-preferences.sh`. |
| [`zprofile`](https://github.com/aclark4life/dotfiles/blob/main/zprofile) | Login shell configuration. |
| [`zshrc`](https://github.com/aclark4life/dotfiles/blob/main/zshrc) | Oh My Zsh configuration. |

# Checkout Manager

- …

# Just

- [just](https://github.com/casey/just) is installed by `brew` (`brewfile/developer/Brewfile`) and replaces the old `Makefile`/[project-makefile](https://github.com/aclark4life/project-makefile) setup.
- Recipes live in `justfile`; run them with the `j` alias (`je` to edit, `jl` to list).

# MongoDB

- MongoDB is installed by `m` which is installed by `npm` which is installed by `nvm` as described in [setup](https://github.com/aclark4life/setup?tab=readme-ov-file#nvm).
- `mongo-orchestration` is installed by `pipx` and is aliased to `ml` and `mo` which are used to start and stop the MongoDB server and orchestration server respectively.
- `mongosh` and `mongodb-atlas-cli` are installed by `brew`.

# Oh My Zsh

- …

# Python

- Python is installed by `pyenv` which is installed by `brew`.
- `pipx` is installed by `pip` which is installed by `pyenv`.
- Additional Python packages used by all projects are installed by `pipx`.
- Virtual environments are created by the `v` alias which is an alias for `mkv` which is provided by the Python plugin for Oh My Zsh.
- `mkv` is further customized to use `uv` instead of `python -m venv`.
- The Python plugin for Oh My Zsh includes the `PYTHON_AUTO_VRUN=true` setting!

[Back to top](#dotfiles)
