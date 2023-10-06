# Neovim Lua configuration

## Install Packer

https://github.com/wbthomason/packer.nvim

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
## Source packer.lua

```bash
cd ~/.config/nvim/lua/alex
nvim
```
Ignore errors.


In the neovim terminal:

```
:edit packer.lua
:so
:PackerSync
```

to source the file and sync Packer. Close the session, then reopen.
