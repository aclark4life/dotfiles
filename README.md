# dotfiles

> "My dotfiles are public!" —Alex

- Managed with [dotfiles](https://github.com/jbernard/dotfiles).
- Used by [setup](https://github.com/aclark4life/setup).

## Table of Contents
- [Brewfile](#brewfile)
- [AWS](#aws)
    - [config](#config)
- [Tree](#tree)

## `Brewfile`

- Brew formulas and casks installed with [`u`](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L12-L19)

## `aws/`

- No `credentials` file.
- Credentials set per-directory via [`direnv`](https://github.com/aclark4life/dotfiles/blob/main/zsh/direnv.zsh)

### `config`

- Set the default region.

## `config/`

### `nvim/`

#### `init.vim`

## Tree

```
.
├── Brewfile
├── aws
│   ├── config
├── checkoutmanager.cfg
├── config
│   └── nvim
├── dotfilesrc
├── inputrc
├── nvm
│   └── nvm.sh
├── project.mk
├── server
│   ├── server.inetloc
│   ├── server.rdp
│   └── server.vncloc
├── ssh
│   ├── config
├── terminal_change_color.scpt
├── vimrc
├── zprofile
├── zsh
│   ├── add_shortcuts_folder_to_dock.zsh
│   ├── aliases.zsh
│   ├── direnv.zsh
│   ├── functions.zsh
│   └── terminal_change_color.zsh
└── zshrc

10 directories, 29 files
```
