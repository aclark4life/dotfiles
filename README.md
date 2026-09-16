# dotfiles

> "My dotfiles are public!" —Alex

- Managed with [dotfiles](https://github.com/jbernard/dotfiles).
- Used by [setup](https://github.com/aclark4life/setup).

## Table of Contents

- **Files and directories**

  - [LICENSE.txt](#licensetxt)
  - [README.md](#readmemd)
  - [brewfile](#brewfile)
  - [checkoutmanager.cfg](#checkoutmanagercfg)
  - [config](#config)
  - [dotfilesrc](#dotfilesrc)
  - [Finder](#finder)
  - [gitconfig](#gitconfig)
  - [inputrc](#inputrc)
  - [justfile](#justfile)
  - [macos-system-preferences.sh](#macos-system-preferencessh)
  - [npmrc](#npmrc)
  - [nvm](#nvm)
  - [oh-my-zsh-custom](#oh-my-zsh-custom)
  - [package.json](#packagejson)
  - [pdbrc](#pdbrc)
  - [pipxfile](#pipxfile)
  - [ssh](#ssh)
  - [terminal-background-color.scpt](#terminal-background-colorscpt)
  - [wallpaper-rotate.sh](#wallpaper-rotatesh)
  - [zprofile](#zprofile)
  - [zshrc](#zshrc)

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

## [LICENSE.txt](https://github.com/aclark4life/dotfiles/blob/main/LICENSE.txt)

- Ye Olde [MIT License](https://opensource.org/license/mit).

## [README.md](https://github.com/aclark4life/dotfiles/blob/main/README.md)

- This file.

## [brewfile](https://github.com/aclark4life/dotfiles/blob/main/brewfile)

- `base/Brewfile` and `developer/Brewfile` contain brew formulas and casks.
- Installed and updated with the [`u`](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/aliases.zsh) alias, which calls [`brewfiles`](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/functions.zsh).

## [checkoutmanager.cfg](https://github.com/aclark4life/dotfiles/blob/main/checkoutmanager.cfg)

- Contains repositories managed by [checkoutmanager](https://github.com/reinout/checkoutmanager).
- Additional repositories found in `.config/checkoutmanager/checkoutmanager.cfg` will be managed by [oh-my-zsh-custom/functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/functions.zsh).

## [config](https://github.com/aclark4life/dotfiles/blob/main/config)

- Disable mouse in [config/nvim/init.lua](https://github.com/aclark4life/dotfiles/blob/main/config/nvim/init.lua).
- [config/kitty/kitty.conf](https://github.com/aclark4life/dotfiles/blob/main/config/kitty/kitty.conf) configures the [kitty](https://sw.kovidgoyal.net/kitty/) terminal.

## [dotfilesrc](https://github.com/aclark4life/dotfiles/blob/main/dotfilesrc)

- Configuration file for [dotfiles](https://github.com/jbernard/dotfiles).

## [Finder](https://github.com/aclark4life/dotfiles/blob/main/Finder)

- Contains macOS Finder shortcuts to launch server connections.

## [gitconfig](https://github.com/aclark4life/dotfiles/blob/main/gitconfig)

- Global git config: `user.name` and `user.email`.
- Symlinked to `~/.gitconfig` by [dotfiles](https://github.com/jbernard/dotfiles).

## [inputrc](https://github.com/aclark4life/dotfiles/blob/main/inputrc)

- Enable `vi` key bindings for Readline in the Python interpreter.

## [justfile](https://github.com/aclark4life/dotfiles/blob/main/justfile)

- Recipes for [just](https://github.com/casey/just), which replaced the old `Makefile`/`project.mk` (see [Just](#just)).
- Run with the [`j`](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/aliases.zsh) alias (also `je` to edit, `jl` to list recipes).

## [macos-system-preferences.sh](https://github.com/aclark4life/dotfiles/blob/main/macos-system-preferences.sh)

- Applies macOS System Preferences settings; safe to re-run. Aliased to `macprefs`.
- Installs the [wallpaper-rotate.sh](#wallpaper-rotatesh) LaunchAgent.

## [npmrc](https://github.com/aclark4life/dotfiles/blob/main/npmrc)

- Allows post-install scripts for `node-pty` and `@github/keytar`.

## [nvm](https://github.com/aclark4life/dotfiles/blob/main/nvm)

- Configure [Node Version Manager](https://github.com/nvm-sh/nvm).

## [oh-my-zsh-custom](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom)

- Oh My Zsh customizations.

    - [aliases.zsh](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/aliases.zsh)
    - [functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/functions.zsh)
    - [scripts.zsh](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/scripts.zsh)
    - [variables.zsh](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/variables.zsh)

## [package.json](https://github.com/aclark4life/dotfiles/blob/main/package.json)

- `npm install -g` via [functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/functions.zsh).

## [pdbrc](https://github.com/aclark4life/dotfiles/blob/main/pdbrc)

- Configure `vi` key bindings in Readline in `pdb`.

## [pipxfile](https://github.com/aclark4life/dotfiles/blob/main/pipxfile)

- Contains "pipx packages".
- Installed and updated by `pipx` with the [`u`](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/aliases.zsh) alias and [`pipxfiles`](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/functions.zsh) function.

## [ssh](https://github.com/aclark4life/dotfiles/blob/main/ssh)

- Configure ssh identity in [ssh/config](https://github.com/aclark4life/dotfiles/blob/main/ssh/config).
- Create identity file with [k](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom/aliases.zsh).

## [terminal-background-color.scpt](https://github.com/aclark4life/dotfiles/blob/main/terminal-background-color.scpt)

- Picks a random theme for Terminal.app.

## [wallpaper-rotate.sh](https://github.com/aclark4life/dotfiles/blob/main/wallpaper-rotate.sh)

- Rotates the desktop wallpaper hourly via a LaunchAgent installed by [macos-system-preferences.sh](#macos-system-preferencessh).

## [zprofile](https://github.com/aclark4life/dotfiles/blob/main/zprofile)

- Login shell configuration.

## [zshrc](https://github.com/aclark4life/dotfiles/blob/main/zshrc)

- Oh My Zsh configuration.

# Checkout Manager

- …

# Just

- [just](https://github.com/casey/just) is installed by `brew` (`brewfile/developer/Brewfile`) and replaces the old `Makefile`/[project-makefile](https://github.com/aclark4life/project-makefile) setup.
- Recipes live in [justfile](#justfile); run them with the `j` alias (`je` to edit, `jl` to list).

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
