-- just sum basic neovim settings

vim.g.mapleader = " "

local opt = vim.opt

-- Appearance
opt.number = true         -- show line numbers
opt.relativenumber = true -- relative line numbers
opt.cursorline = true     -- highlight current line
opt.termguicolors = true  -- true color support
opt.signcolumn = "yes"    -- always show sign column

-- Tabs & indentation
opt.expandtab = true -- spaces not tabs
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
