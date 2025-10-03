
```markdown
# 🧠 Neovim Configuration

A modular, feature-rich Neovim setup powered by [lazy.nvim](https://github.com/folke/lazy.nvim). Designed for fast startup, deep language support, and a clean UI.

**Repository:** [https://github.com/ardavancena/neovim-config-v0.11.4](https://github.com/ardavancena/neovim-config-v0.11.4)  
**Author:** Ardavan Najafzadeh  
**Email:** ardavan.najafzadeh@gmail.com

---

## 🚀 Core Setup

### lazy.nvim – Fast plugin management
```bash
git clone https://github.com/folke/lazy.nvim ~/.config/nvim/lazy
```

### Mason – LSP, DAP, linters, formatters
```vim
:Mason
```

### LSP Servers
```vim
:LspInstall pyright
:LspInstall tsserver
:LspInstall clangd
```

### Treesitter – Syntax highlighting
```vim
:TSInstall lua
:TSInstall python
:TSInstall javascript
```

---

## ✨ Features

- Lazy-loaded plugins for fast startup
- Autocompletion via `nvim-cmp` and `LuaSnip`
- Built-in LSP support for multiple languages
- Syntax highlighting with Treesitter
- Integrated terminal and debugging (DAP)
- File navigation with Telescope
- Git integration and notifications
- Modular Lua-based config
- Markdown preview support
- Harpoon for fast file switching
- Smear-cursor animation plugin
- Alpha dashboard
- Blink cursor effects
- Neo-tree file explorer
- Lualine statusline
- Autopairs and completion engine
- Theme switching via `themes.lua`

---

## 🧩 Plugin Management

```vim
:Lazy         " Check plugin status
:Lazy update  " Update all plugins
:Lazy sync    " Sync and install
:Lazy clean   " Remove unused plugins
```

---

## 🧠 Key Mappings

- `K` – Hover info
- `gd` – Go to definition
- `<leader>ca` – Code actions

---

## 📁 Project Structure

```
~/.config/nvim/
├── README.md
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── plugins/
│   │   ├── alpha.lua
│   │   ├── autopairs.lua
│   │   ├── blink.lua
│   │   ├── colors.lua
│   │   ├── completion.lua
│   │   ├── harpoon.lua
│   │   ├── lsp-config.lua
│   │   ├── lualine.lua
│   │   ├── markdown-preview.lua
│   │   ├── neo-tree.lua
│   │   ├── smear-cursor.lua
│   │   ├── telescope.lua
│   │   ├── themes.lua
│   │   └── treesitter.lua
│   └── vim-options.lua
├── node_modules/
│   └── 22/
│       ├── README.md
│       └── package.json
├── package-lock.json
├── package.json
```

---

## 📦 Installation

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mkdir -p ~/.config/nvim
git clone https://github.com/ardavancena/neovim-config-v0.11.4 ~/.config/nvim
nvim
```

Lazy.nvim will auto-install all plugins on first launch.
```

