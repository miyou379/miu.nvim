# Neovim Configuration of miu
**My personal dotfiles for Neovim**
![](https://img-blog.csdnimg.cn/948390abb7aa4b20ad51082c77f80623.png#pic_center)
## A simple & extensible conf of Neovim on Linux
## View /nvim/help/keymap.txt for instructions

> My environment:
> Ubuntu 20.04
> Neovim 0.9

### Plugin List
**Use Lazy.nvim as Plugin Manager**
> bufferline  dap (with dap-ui)  nvim-lspconfig
> vim-multicursor  telescope  trouble
> [windows]  cmp  [easy-align]
> lsp_signature  neo-tree  comment
> indent-blankline  lualine  scrollbar
> nvim-treesitter  which-key

### To use my dotfiles, you need to configure your local env first
Default settings are for C/Cpp/Python/Golang/Rust/Lua
You need to setup some core applications for the LSP to run correctly
And be sure that you have aready installed the languages.

> **Here's the list:**
> **C/Cpp:**
> ccls (LSP) , vscode-cpptools
> **Python:**
> pyright (LSP) , debugpy
> **Golang**
> gopls (LSP) , delve
> **Rust**
> rust-analyzer (LSP)
> **Lua**
> lua_ls (LSP)

Having installed all of them, just config some PATH in lsp.lua&dap.lua, then enjoy your Neovim trip!
