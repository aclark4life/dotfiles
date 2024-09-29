# dotfiles

> "My dotfiles are public!" —Alex

- Managed with [dotfiles](https://github.com/jbernard/dotfiles).
- Used by [setup](https://github.com/aclark4life/setup).

## Table of Contents
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
- [terminal_change_color.scpt](#terminal_change_colorscpt)
- [vimrc](#vimrc)
- [zprofile](#zprofile)
- [zsh](#zsh)
- [zshrc](#zshrc)

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
├── terminal_change_color.scpt
├── vimrc
├── zprofile
├── zsh
│   ├── add_shortcuts_folder_to_dock.zsh
│   ├── aliases.zsh
│   ├── direnv.zsh
│   ├── functions.zsh
│   ├── requirements.txt
│   ├── terminal_change_color.zsh
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

- Enable vi key bindings for readline in the Python interpreter.

## [nvm](https://github.com/aclark4life/dotfiles/blob/main/nvm)

- Configure [Node Version Manager](https://github.com/nvm-sh/nvm).

## [pdbrc](https://github.com/aclark4life/dotfiles/blob/main/pdbrc)

- Configure vi key bindings in readline in pdb.

## [project.mk](https://github.com/aclark4life/dotfiles/blob/main/project.mk)

- Ye Olde [Project Makefile](https://github.com/aclark4life/project-makefile).

## [requirements.txt](https://github.com/aclark4life/dotfiles/blob/main/requirements.txt)

- Contains Python packages.
- Installed and updated by `pipx` with the [`u`](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L13-L20) alias.

## [server](https://github.com/aclark4life/dotfiles/blob/main/server)

- Contains macOS Finder shortcuts to launch server connections.

## [ssh](https://github.com/aclark4life/dotfiles/blob/main/ssh)

- Configure ssh identity in [ssh/config](https://github.com/aclark4life/dotfiles/blob/main/ssh/config).
- Create identity file with [k](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L3).

## [terminal_change_color.scpt](https://github.com/aclark4life/dotfiles/blob/main/terminal_change_color.scpt)

- Picks a random theme for Terminal.app, managed by Oh My ZSH in [terminal_change_color.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/terminal_change_color.zsh).

## [vimrc](https://github.com/aclark4life/dotfiles/blob/main/vimrc)

- Set tab to 4 spaces.

## [zprofile](https://github.com/aclark4life/dotfiles/blob/main/zprofile)

- Login shell configuration.

## [zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh)

- Oh My Zsh user configuration.

    - [add_shortcuts_folder_to_dock.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/add_shortcuts_folder_to_dock.zsh)
    - [aliases.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh)
    - [direnv.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/direnv.zsh)
    - [functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/functions.zsh)
    - [requirements.txt](https://github.com/aclark4life/dotfiles/blob/main/zsh/requirements.txt)
    - [terminal_change_color.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/terminal_change_color.zsh)

## [zshrc](https://github.com/aclark4life/dotfiles/blob/main/zshrc)

- Oh My Zsh configuration.
