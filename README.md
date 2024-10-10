# dotfiles

> "My dotfiles are public!" —Alex

- Managed with [dotfiles](https://github.com/jbernard/dotfiles).
- Used by [setup](https://github.com/aclark4life/setup).

## Table of Contents

- **Files and directories**

  - [Brewfile](#brewfile)
  - [LICENSE.txt](#licensetxt)
  - [Makefile](#makefile)
  - [README.md](#readmemd)
  - [aws](#aws)
  - [checkoutmanager.cfg](#checkoutmanagercfg)
  - [config](#config)
  - [dotfilesrc](#dotfilesrc)
  - [inputrc](#inputrc)
  - [nvm](#nvm)
  - [pdbrc](#pdbrc)
  - [project.mk](#projectmk)
  - [requirements.txt](#requirementstxt)
  - [server](#server)
  - [ssh](#ssh)
  - [terminal-background-color.scpt](#terminal-background-colorscpt)
  - [vimrc](#vimrc)
  - [zprofile](#zprofile)
  - [oh-my-zsh-custom](#oh-my-zsh-custom)
  - [zshrc](#zshrc)

- **Description**

  - [Checkout Manager](#checkout-manager)
  - [MongoDB](#mongodb)
  - [Oh My ZSH](#ohmyzsh)
  - [Python](#python)

## Tree

```
.
├── Brewfile
├── LICENSE.txt
├── Makefile
├── README.md
├── aws
│   └── config
├── checkoutmanager.cfg
├── config
│   └── nvim
├── dotfilesrc
├── inputrc
├── nvm
│   └── nvm.sh
├── pdbrc
├── project.mk
├── server
│   ├── server.inetloc
│   ├── server.rdp
│   └── server.vncloc
├── ssh
│   └── config
├── terminal-background-color.scpt
├── vimrc
├── zprofile
├── oh-my-zsh-custom
│   ├── aliases.zsh
│   ├── functions.zsh
│   ├── scripts.zsh
│   └── variables.zsh
└── zshrc

8 directories, 25 files
```

## [Brewfile](https://github.com/aclark4life/dotfiles/blob/main/Brewfile)

- Contains brew formulas and casks.
- Installed and updated with the [`u`](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L13-L20) alias.

## [LICENSE.txt](https://github.com/aclark4life/dotfiles/blob/main/LICENSE.txt)

- Ye Olde [MIT License](https://opensource.org/license/mit).

## [Makefile](https://github.com/aclark4life/dotfiles/blob/main/Makefile)

- Ye Olde custom [Project Makefile](https://github.com/aclark4life/project-makefile).

## [README.md](https://github.com/aclark4life/dotfiles/blob/main/README.md)

- This file.

## [aws](https://github.com/aclark4life/dotfiles/blob/main/aws)

- No `aws/credentials` file here.
- Credentials are set per-directory via [`direnv`](https://github.com/aclark4life/dotfiles/blob/main/zsh/direnv.zsh#L15-L37).
- Set the default region in [aws/config](https://github.com/aclark4life/dotfiles/blob/main/aws/config).

## [checkoutmanager.cfg](https://github.com/aclark4life/dotfiles/blob/main/checkoutmanager.cfg)

- Contains repositories managed by [checkoutmanager](https://github.com/reinout/checkoutmanager).
- Additional repositories found in `.config/checkoutmanager/checkoutmanager.cfg` will be managed by [zsh/functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/functions.zsh#L1-L18).

## [config](https://github.com/aclark4life/dotfiles/blob/main/config)

- Disable mouse in [config/nvim/init.vim](https://github.com/aclark4life/dotfiles/blob/main/config/nvim/init.vim).

## [dotfilesrc](https://github.com/aclark4life/dotfiles/blob/main/dotfilesrc)

- Configuration file for [dotfiles](https://github.com/jbernard/dotfiles).

## [inputrc](https://github.com/aclark4life/dotfiles/blob/main/inputrc)

- Enable `vi` key bindings for Readline in the Python interpreter.

## [nvm](https://github.com/aclark4life/dotfiles/blob/main/nvm)

- Configure [Node Version Manager](https://github.com/nvm-sh/nvm).

## [pdbrc](https://github.com/aclark4life/dotfiles/blob/main/pdbrc)

- Configure `vi` key bindings in Readline in `pdb`.

## [project.mk](https://github.com/aclark4life/dotfiles/blob/main/project.mk)

- Ye Olde [Project Makefile](https://github.com/aclark4life/project-makefile).

## [requirements.txt](https://github.com/aclark4life/dotfiles/blob/main/requirements.txt)

- Contains "pipx packages".
- Installed and updated by `pipx` with the [`u`](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L13-L20) alias and [`pipx_install_from_file`](https://github.com/aclark4life/dotfiles/blob/main/zsh/functions.zsh#L33-L56) function.

## [server](https://github.com/aclark4life/dotfiles/blob/main/server)

- Contains macOS Finder shortcuts to launch server connections.

## [ssh](https://github.com/aclark4life/dotfiles/blob/main/ssh)

- Configure ssh identity in [ssh/config](https://github.com/aclark4life/dotfiles/blob/main/ssh/config).
- Create identity file with [k](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L3).

## [terminal-background-color.scpt](https://github.com/aclark4life/dotfiles/blob/main/terminal-background-color.scpt)

- Picks a random theme for Terminal.app, managed by Oh My ZSH in [terminal-background-color.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/terminal-background-color.zsh).

## [vimrc](https://github.com/aclark4life/dotfiles/blob/main/vimrc)

- Set tab to 4 spaces.

## [zprofile](https://github.com/aclark4life/dotfiles/blob/main/zprofile)

- Login shell configuration.

## [oh-my-zsh-custom](https://github.com/aclark4life/dotfiles/blob/main/oh-my-zsh-custom)

- Oh My Zsh customizations.

    - [aliases.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh)
    - [functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/functions.zsh)
    - [scripts.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/scripts.zsh)
    - [variables.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/variables.zsh)

## [zshrc](https://github.com/aclark4life/dotfiles/blob/main/zshrc)

- Oh My Zsh configuration.

# Checkout Manager

- …

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
