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

- Contains brew formulas and casks.
- Installed with [`u`](https://github.com/aclark4life/dotfiles/blob/main/zsh/aliases.zsh#L13-L20).

## `aws/`

- No `aws/credentials` file.
- Credentials set per-directory via [`direnv`](https://github.com/aclark4life/dotfiles/blob/main/zsh/direnv.zsh#L15-L37).
- Set the default region in [aws/config](https://github.com/aclark4life/dotfiles/blob/main/aws/config).

## `checkoutmanager.cfg`

- Contains repositories managed by [checkoutmanager](https://github.com/reinout/checkoutmanager).
- Additional repositories managed in `.config/checkoutmanager/checkoutmanager.cfg` by [zsh/functions.zsh](https://github.com/aclark4life/dotfiles/blob/main/zsh/functions.zsh#L1-L18).

## `config/`

- Disable mouse in [config/nvim/init.vim](https://github.com/aclark4life/dotfiles/blob/main/config/nvim/init.vim).

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
