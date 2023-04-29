-- Install Lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Configuration of Lazy.nvim

require("lazy").setup("plugins") --Setup Plugins

vim.cmd('colorscheme catppuccin-macchiato') --Set Theme
-- rose-pine, nord, catppuccin-latte/frappe/macchiato/mocha

require("conf.plukeys") --Set Plugins' Keymap

