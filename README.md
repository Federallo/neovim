## Repository Structure

```
.config/nvim/
├── init.lua                    # Entry point, core options & global keymaps
├── lua/
│   ├── plugins.lua             # Plugin declarations (lazy.nvim spec)
│   ├── plugins-configs/        # Per-plugin configuration files
│   │   ├── init.lua            # Loads all plugin configs
│   │   ├── alpha.lua           # Dashboard/start screen
│   │   ├── bufferline.lua      # Tab/buffer line
│   │   ├── lualine.lua         # Statusline
│   │   ├── lsp-zero.lua        # LSP setup via lsp-zero + mason
│   │   ├── mason.lua           # Mason (LSP installer) minimal config
│   │   ├── telescope.lua       # Fuzzy finder keymaps
│   │   └── toggleterm.lua      # Floating terminal
│   └── lazy-lock.json          # Pinned plugin versions (reproducible builds)
```
## Core Settings (`init.lua`)
| Setting | Value | Description |
|---------|-------|-------------|
| `mapleader` | `Space` | Leader key for all custom mappings |
| `number` | `true` | Show line numbers |
| `termguicolors` | `true` | True color support |
| `shiftwidth` / `tabstop` / `softtabstop` | `2` | 2-space indentation |
| `cursorline` | `true` | Highlight current line |
| `copilot_enabled` | `false` | GitHub Copilot disabled by default |
### Global Keymaps
| Key | Mode | Action |
|-----|------|--------|
| `<leader>k` | Normal | Next buffer (`:bnext`) |
| `<leader>j` | Normal | Previous buffer (`:bprev`) |
| `<leader>r` | Normal | Reload config (`source $MYVIMRC`) |
| `>` / `<` | Visual | Indent/outdent **and keep selection** |
## Plugins Overview (`plugins.lua`)
| Plugin | Purpose | Version/Pin |
|--------|---------|-------------|
| **lazy.nvim** | Plugin manager | `stable` branch |
| **mason.nvim** | LSP/DAP/Linter installer | `v1.10.0` |
| **mason-lspconfig.nvim** | Bridge mason ↔ lspconfig | `v1.31.0` |
| **lsp-zero.nvim** | Opinionated LSP setup | `v3.x` branch |
| **nvim-lspconfig** | LSP configurations | `v1.8.0` |
| **nvim-cmp** | Completion engine | `main` |
| **cmp-nvim-lsp** | LSP source for cmp | `main` |
| **LuaSnip** | Snippet engine | `master` |
| **indent-blankline.nvim (ibl)** | Indent guides | `main` |
| **nvim-autopairs** | Auto-close brackets | `main` |
| **toggleterm.nvim** | Floating terminal | `*` (latest) |
| **nvim-web-devicons** | File icons | `main` |
| **alpha-nvim** | Start dashboard | `main` |
| **copilot.vim** | GitHub Copilot | `release` branch |
| **plenary.nvim** | Lua utilities (required by telescope) | `main` |
| **telescope.nvim** | Fuzzy finder | `0.1.8` tag |
| **bufferline.nvim** | Buffer tabs | `v3.*` tag |
| **gruvbox.nvim** | Colorscheme | `main` |
| **lualine.nvim** | Statusline | `main` |
> **Reproducible builds:** All plugins are pinned via `lazy-lock.json` — run `:Lazy sync` to restore exact versions.
## Plugin Configurations
### alpha-nvim (Dashboard)
Custom header with ASCII art, buttons for:
- `e` — New file
- `f` — Find file (Telescope)
- `r` — Recent files
- `l` — Open Lazy
- `q` — Quit
### bufferline.nvim
- Tab size: 30 chars
- LSP diagnostics indicators (errors/warnings/info)
- NvimTree offset support
- `thick` separator style
- Close buffers with mouse (middle/right click)
### lualine.nvim
- Theme: `auto` (inherits gruvbox)
- Sections:
  - **Left:** mode, git branch, diff, diagnostics
  - **Center:** filename
  - **Right:** encoding, fileformat, filetype, progress, location
- Global statusline: `false` (per-window)
### telescope.nvim
- `<space>t` → `find_files`
### toggleterm.nvim
- Floating terminal (`direction = 'float'`)
- `<space>T` → toggle terminal
- `<esc>` in terminal mode → exit to normal mode
- Size: 180×30, curved border, `winblend = 3`
- Persists size/mode, starts in insert mode
### mason.nvim
Minimal setup — defaults only.
### lsp-zero.nvim (LSP Core)
**Servers installed via mason:**
- `ts_ls` — TypeScript/JavaScript (with `checkJs: true` for JS/JSX error checking)
- `rust_analyzer` — Rust
- `docker_compose_language_service` — Docker Compose
- `dockerls` — Dockerfile
- `html` — HTML
- `jdtls` — Java
- `lua_ls` — Lua
- `jedi_language_server` — Python
- `ltex` — LaTeX/Markdown/BibTeX (grammar/spell)
**Behavior:**
- Default keymaps via `lsp_zero.default_keymaps()`
- Diagnostics: virtual text + severity sort + rounded float on `CursorHold`
- `updatetime = 300` for faster diagnostic popups
### Completion (nvim-cmp)
- **Enter (`<CR>`)** confirms **only if** a suggestion is explicitly selected (`select = false`)
- Uses LuaSnip for snippets
## Quick Start
```bash
# Clone to Neovim config directory
git clone https://github.com/Federallo/neovim ~/.config/nvim

# Start Neovim — lazy.nvim will bootstrap and install plugins
nvim

# Inside Neovim:
:Lazy sync        # Restore exact pinned versions from lazy-lock.json
:Mason            # Verify LSP servers installed
:checkhealth      # Diagnostics
```
## Maintenance Commands
| Command | Purpose |
|---------|---------|
| `:Lazy update` | Update plugins (respects version pins) |
| `:Lazy sync` | Sync to `lazy-lock.json` (reproducible) |
| `:Mason` | Manage LSP servers / DAP / linters |
| `:MasonUpdate` | Update mason registry |
| `<leader>r` | Reload config without restart |
| `:Telescope find_files` | Find files (or `<space>t`) |
| `<space>T` | Toggle floating terminal |
## Customization Tips
1. **Enable Copilot:** `:Copilot enable` (currently disabled globally)
2. **Add LSP servers:** Edit `lsp-zero.lua` → `ensure_installed` table
3. **Change theme:** Modify `plugins.lua` → `vim.cmd([[colorscheme ...]])`
4. **Adjust indent:** Change `shiftwidth`/`tabstop`/`softtabstop` in `init.lua`
5. **Add keymaps:** Append to `init.lua` or create a dedicated `keymaps.lua` in `plugins-configs/`
