# Neovim Config Notes

> **Leader key:** `Space`

---

## 📦 Plugins

| Plugin | Role |
|--------|------|
| `lazy.nvim` | Plugin manager |
| `mason` + `mason-lspconfig` | LSP installer |
| `nvim-lspconfig` | LSP configs (clangd, pyright, lua_ls) |
| `nvim-cmp` + `luasnip` | Completion + snippets |
| `none-ls` | Formatter (stylua, prettier, black, clang_format, isort, asmfmt) |
| `nvim-treesitter` | Syntax highlighting & indent |
| `fzf-lua` | Fuzzy finder |
| `neo-tree` | File tree sidebar |
| `oil.nvim` | File manager (edit files like a buffer) |
| `toggleterm` | Floating / horizontal terminal |
| `nvim-dap` + `dap-ui` | Debugger (Python supported) |
| `render-markdown` | Render markdown in buffer |
| `markdown-preview` | Preview markdown in browser |
| `lsp_signature` | Function signature hint on insert |
| `nvim-autopairs` | Auto close brackets |
| `nvim-surround` | Surround text objects |
| `Comment.nvim` | Toggle comments |
| `neoscroll` | Smooth scrolling |
| `indent-blankline` | Indent guide lines |
| `lualine` | Status line |
| `everforest` + `catppuccin` | Themes |
| `transparent.nvim` | Toggle background transparency |
| `vim-tmux-navigator` | Navigate between nvim & tmux panes |

---

## ⌨️ Keymaps

### General

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | Normal | Clear search highlight |
| `J` | Visual | Move selected lines down |
| `K` | Visual | Move selected lines up |
| `<leader>p` | Visual | Paste over selection without overwriting clipboard |
| `<leader>fk` | Normal | Browse all keymaps (FzfLua) |

---

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `K` | Normal | Hover documentation |
| `gr` | Normal | Show references |
| `gi` | Normal | Go to implementation |
| `<leader>D` | Normal | Go to type definition |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>gf` | Normal | Format current file |

---

### Diagnostics / Errors

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ne` | Normal | Jump to next error |
| `<leader>pe` | Normal | Jump to previous error |
| `<leader>se` | Normal | Show error detail (floating window) |
| `<leader>ce` | Normal | Copy error message at cursor to clipboard |

---

### Completion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<Tab>` | Insert | Select next item |
| `<CR>` | Insert | Confirm selected item |

---

### Fuzzy Finder (fzf-lua)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>pf` | Normal | Find git-tracked files |
| `<leader>fg` | Normal | Live grep |
| `<leader>fG` | Normal | Live grep (include hidden files) |
| `<leader>fs` | Normal | Grep with manual input |
| `<leader>fb` | Normal | Browse open buffers |
| `<leader>fh` | Normal | Search help tags |

> **Tip:** Inside fzf window, press `Ctrl-q` to send all results to quickfix list.

---

### File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle Neo-tree sidebar |
| `<leader>vv` | Normal | Open Oil (parent directory) |
| `<leader>vf` | Normal | Open Oil in floating window |
| `<leader>vi` | Normal | Show file info under cursor (Oil) |
| `<leader>vt` | Normal | Show directory tree (floating, depth 4) |

#### Oil internal keymaps (active only inside Oil buffer)

| Key | Action |
|-----|--------|
| `<CR>` | Open file / enter directory |
| `-` | Go to parent directory |
| `_` | Open current working directory |
| `H` | Toggle hidden files |
| `<C-p>` | Preview file (vertical split) |
| `<C-t>` | Open in new tab |
| `<C-c>` | Close Oil |
| `R` | Refresh |
| `gs` | Change sort order |
| `gx` | Open file externally |
| `g\` | Toggle trash view |
| `g?` | Show help |

---

### Terminal (toggleterm)

| Key | Mode | Action |
|-----|------|--------|
| `<C-\>` | Normal | Open / close terminal |
| `<leader>tf` | Normal / Terminal | Toggle direction: float ↔ horizontal |
| `<F5>` | Normal | Smart compile & run (C++ / Python) |

> **Smart Run (`<F5>`):** auto-saves, detects filetype, compiles and runs in terminal.
> - C++: `g++ file.cpp -o file && ./file`
> - Python: uses `.venv` if available, otherwise `python3`

---

### Debugging (nvim-dap)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>dt` | Normal | Toggle breakpoint |
| `<leader>dc` | Normal | Continue / start session |
| `<leader>do` | Normal | Step over |
| `<leader>di` | Normal | Step into |

> DAP UI opens/closes automatically on session start/end.
> Python debugger uses `~/.local/share/nvim/dap-python/bin/python`.

---

### Scrolling (neoscroll)

| Key | Action |
|-----|--------|
| `<C-e>` | Scroll up half page |
| `<C-d>` | Scroll down half page |
| `<C-b>` | Scroll up full page |
| `<C-f>` | Scroll down full page |
| `<C-y>` | Scroll view up 3 lines (cursor stays) |
| `<C-u>` | Scroll view down 3 lines (cursor stays) |
| `zt` | Cursor line → top of screen |
| `zz` | Cursor line → center of screen |
| `zb` | Cursor line → bottom of screen |

---

### Themes & UI

| Key | Mode | Action |
|-----|------|--------|
| `<leader>nt` | Normal | Cycle theme (everforest → catppuccin → ...) |
| `<leader>tt` | Normal | Toggle background transparency |

---

### Tmux Navigator

| Key | Action |
|-----|--------|
| `C-h` | Navigate left (nvim ↔ tmux) |
| `C-j` | Navigate down |
| `C-k` | Navigate up |
| `C-l` | Navigate right |

---

### Comments (Comment.nvim — default keymaps)

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gc` + motion | Normal | Toggle comment over motion |
| `gbc` | Normal | Toggle block comment |
| `gc` | Visual | Toggle comment on selection |

---

### Surround (nvim-surround — default keymaps)

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround around motion |
| `ds{char}` | Delete surrounding character |
| `cs{old}{new}` | Change surrounding character |
|`VS + { / [ / (` |Add {} / [] / () around block|


> Example: `ysiw"` → surround word with `"`, `ds"` → remove `"`, `cs"'` → change `"` to `'`

---

### Markdown

| Command | Action |
|---------|--------|
| `:MarkdownPreview` | Open preview in browser |
| `:MarkdownPreviewToggle` | Toggle browser preview |
| `:MarkdownPreviewStop` | Stop browser preview |

> `render-markdown.nvim` renders markdown visually **inside the buffer** automatically.

---

### Snippets (LuaSnip)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>nw` | Normal | Jump to next snippet node |

#### Custom snippets

| Trigger | Filetype | Expands to |
|---------|----------|------------|
| `maincpp` | `cpp` | Full C++ `main()` boilerplate |

---

### Help

| Key | Action |
|-----|--------|
| `q` | Close help floating window |

> All `:help` pages open as a **centered floating window** (80% screen size) instead of a split.

---

### Misc

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cp` | Normal | Copy absolute file path to clipboard (+ wl-copy) |
| `<leader>ob` | Normal | Open current file in browser (`xdg-open`) |

---

## 🌐 LSP Servers

Managed by Mason, auto-installed:

| Server | Language |
|--------|----------|
| `clangd` | C / C++ |
| `pyright` | Python |
| `lua_ls` | Lua |

Formatters (none-ls): `stylua`, `prettier`, `black`, `isort`, `clang_format`, `asmfmt`

---

## 🔧 Editor Settings

| Setting | Value |
|---------|-------|
| Tab size | 4 spaces |
| Line numbers | Relative + absolute |
| Cursor line | Enabled |
| Color column | 94 |
| Clipboard | `unnamedplus` (system clipboard) |
| Word wrap | Enabled (`linebreak`) |
| Search highlight | Enabled (clear with `<Esc>`) |
| Input method | Auto-switch to `keyboard-us` on leaving Insert mode (fcitx5) |
