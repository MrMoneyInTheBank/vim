# Neovim config (“chad”)

A fast, minimal-but-complete Neovim setup focused on day-to-day software development: LSP, completion/snippets, formatting-on-save, Telescope, Git, file tree, debugging (DAP), and a nice UI.

This config is loaded via:

- `init.lua` → `require("chad")`
- `lua/chad/init.lua` loads:
  - `lua/chad/settings.lua` (editor options)
  - `lua/chad/mappings.lua` (keymaps via which-key)
  - `lua/chad/lazy.lua` (bootstraps `lazy.nvim`, then loads `lua/chad/plugins/*`)
  - `lua/chad/typst.lua` (Typst export command)

## What you get

- **Plugin manager**: `folke/lazy.nvim` (auto-bootstrapped)
- **LSP**: Mason + `nvim-lspconfig`
  - Configured servers: `lua_ls`, `pyright`, `ruff`, `gopls`, `rust_analyzer`, `clangd`, `ts_ls`, `zls`, `tinymist`
  - Extras: `tailwindcss`, `eslint` are also configured
- **Completion/snippets**: `nvim-cmp` + LuaSnip + friendly-snippets
- **Formatting / diagnostics** (via `none-ls`):
  - Diagnostics: `mypy`
  - Formatting: `stylua`, `black`, `gofumpt`, `goimports-reviser`, `clang-format`, `prettierd`
  - Auto-format on save when a client supports `textDocument/formatting`
- **Debugging**: `nvim-dap` + `dap-ui`, with Mason DAP (`codelldb`) + Python/Go adapters
- **Navigation / UX**:
  - Telescope (+ ui-select)
  - Neo-tree file explorer
  - Bufferline tabs
  - Gitsigns
  - Lazygit integration
  - Which-key
  - Leap motions
  - Surround
  - Autopairs, TS autotag
  - Alpha dashboard
  - Catppuccin theme + Lualine statusline
- **Typst**: syntax + preview, plus a custom `:Export` command
- **Markdown**: `markdown-preview.nvim`
- **Python venv switcher**: `venv-selector.nvim`

## Requirements

### Core

- **Neovim** (recent; ideally 0.9+)
- **Git**

### Recommended CLI tools

- `ripgrep` (Telescope live grep)
- `fd` (Telescope find files)
- `lazygit` (Git UI)

### Language/toolchain (optional, per language)

- **Python**: `python3`, `mypy`, `black`, and (optionally) `debugpy`
- **Go**: `go`, `gofumpt`, `goimports-reviser`
- **JS/TS**: `node`, `prettierd`
- **Lua**: `stylua`
- **C/C++**: `clang-format`
- **Typst**: `typst` (needed for `:Export`, and for preview workflows)

> Tip: Mason can install many LSP/DAP tools for you, but formatters/linters may still be system-managed depending on your setup.

## Install

### macOS (recommended)

1. Clone into your Neovim config directory:

```bash
git clone https://github.com/MrMoneyInTheBank/vim.git ~/.config/nvim
```

2. Run the included bootstrap script (*skip if you already have homebrew and/or a terminal emulator with 24-bit RGB*):

   ```bash
   chmod +x ~/.config/nvim/install.sh
   ~/.config/nvim/install.sh
   ```

What `install.sh` does (macOS only):

- Installs **Homebrew** if missing
- Installs and opens **Alacritty** (and configures **FiraCode Nerd Font** in `~/.config/alacritty/alacritty.yml`)
- Installs: `neovim`, `ripgrep`, `fd`, `lazygit`

### Linux / Windows

`install.sh` currently exits on non-macOS. You can still use the config by installing the dependencies yourself and placing the repo at:

- Linux: `~/.config/nvim`
- Windows: `%APPDATA%\nvim`

## First launch

Open Neovim:

   ```bash
nvim
```

On first run:

- `lazy.nvim` will bootstrap itself and install plugins
- Mason will be available via `:Mason`

## Keymaps you already have

Leader is **Space** (`vim.g.mapleader = " "`).

### Essentials

- **Exit insert mode**: `jk`
- **Indent whole file**: `<leader>ii`
- **Copy entire file**: `<leader>cop`
- **Paste over entire buffer**: `<leader>vipp`

### LSP

- **Hover**: `K`
- **Go to definition**: `gd`
- **Code action**: `<leader>ca`
- **Next / prev diagnostic**: `]d` / `[d`

### Telescope

- **Find files**: `<leader>ff`
- **Live grep**: `<leader>fg`
- **Buffers**: `<leader>fb`
- **Help tags**: `<leader>fh`

### File explorer (Neo-tree)

- **Toggle tree**: `<leader>e`
- **Focus filesystem**: `<leader>fe`

### Buffers

- **Next / prev buffer**: `<Tab>` / `<S-Tab>`
- **Close buffer**: `<leader>x`

### Git

- **LazyGit**: `<leader>lg`

### tmux navigation

- **Pane nav**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`

### Debugging (DAP)

- **Continue**: `<leader>dn` (also `<leader>dr`)
- **Toggle breakpoint**: `<leader>db`

### Python venv

- **Select venv**: `,v` (runs `:VenvSelect`)

### Typst

- **Preview**: `<leader>p` (runs `:TypstPreview`)
- **Export**: `<leader>b` (runs `:Export`)

## Typst export

This config defines a custom `:Export` command which calls:

- `typst compile --format <pdf|png|svg|html> <current-file>`

Examples:

```vim
:Export
:Export pdf
:Export png
```

## Customization notes (important)

### Hardcoded mypy path

`none-ls` is currently configured with a user-specific path (At the time a temporary fix for some issues but made it a permanent fix because I am lazy):

- `command = "/Users/anshumansingh/.local/bin/mypy"`

If you use a different machine, either:

- Remove the `command = ...` override to use your `$PATH`, or
- Point it to your own `mypy` path.

File: `lua/chad/plugins/none-ls.lua`

### Theme

Theme is Catppuccin, statusline uses Lualine. If you want Lualine to match Catppuccin, update `lua/chad/plugins/lualine.lua` (currently set to `ayu_mirage`).

## Useful commands

- **Plugin manager UI**: `:Lazy`
- **Install/manage LSP/DAP tooling**: `:Mason`
- **Check health**: `:checkhealth`

## Troubleshooting

- **Neo-tree replaces netrw**: netrw is disabled in `lua/chad/settings.lua`.
- **Formatting on save not working**: check `:LspInfo` and confirm a formatter is registered; `none-ls` only formats if the attached client supports formatting.
- **mypy not found**: fix the hardcoded path in `lua/chad/plugins/none-ls.lua` or ensure `mypy` is on `$PATH`.

## Plugin list (by area)

- **UI**: `alpha-nvim`, `bufferline.nvim`, `catppuccin`, `lualine.nvim`, `mini.icons`, `which-key.nvim`
- **Search/nav**: `telescope.nvim`, `telescope-ui-select.nvim`, `leap.nvim`, `neo-tree.nvim`
- **Editing**: `Comment.nvim`, `nvim-autopairs`, `nvim-ts-autotag`, `nvim-surround`
- **Git**: `gitsigns.nvim`, `lazygit.nvim`
- **LSP/Tools**: `mason.nvim`, `mason-lspconfig.nvim`, `mason-tool-installer.nvim`, `nvim-lspconfig`, `none-ls.nvim`
- **Completion**: `nvim-cmp`, `cmp-nvim-lsp`, `LuaSnip`, `cmp_luasnip`, `friendly-snippets`, `supermaven-nvim`
- **Debugging**: `nvim-dap`, `nvim-dap-ui`, `mason-nvim-dap.nvim`, `nvim-dap-python`, `nvim-dap-go`
- **Docs/writing**: `markdown-preview.nvim`, `typst.vim`, `typst-preview.nvim`, `venv-selector.nvim`
