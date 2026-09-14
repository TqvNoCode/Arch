## My personal development environment for Arch Linux

### Main tools
 
- pacman (pkg manager)
- nvim (code editor)
- tmux (term multiplexer)
- kitty (terminal emulator)
- zsh (shell)
- GNU stow (symlinks management tool)

## Installing steps
 
### 1. Install required packages
 
```bash
sudo pacman -S git stow neovim tmux kitty zsh
```
 
### 2. Clone the repo
 
```bash
git clone https://github.com/TqvNoCode/Arch ~/dotfiles
cd ~/dotfiles
```
 
### 3. Use Stow to create symlinks
 
After you're already inside folder `/dotfiles`, create symlinks with command `stow`:
 
```bash
stow nvim
stow tmux
stow kitty
stow zsh
```
 
> **Tip:** Use `stow -D <package>` to remove symlinks, and `stow -R <package>` to restow (remove + re-link).
 
### 4. Install Tmux Plugin Manager (TPM)
 
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
 
Start tmux, then press `Prefix + I` (capital I) to fetch and install the plugins defined in `.tmux.conf`.
 
## What else do you need to install
 
### 1. Neovim
 
The nvim config lives at [nvim/.config/nvim](https://github.com/TqvNoCode/Arch/tree/main/nvim/.config/nvim) and uses lazy.nvim to manage plugins. To get everything running without errors, install:
 
- `base-devel` (gcc/make) — required to build the treesitter parsers, LuaSnip (`make install_jsregexp`), and debug adapters
- `ripgrep` — used by fzf-lua's live grep
- `fzf` — the binary fzf-lua depends on
- `unzip`, `wget`, `curl` — needed by Mason to download LSPs/formatters/DAPs
- `nodejs` + `npm` — some LSPs installed via Mason and `markdown-preview.nvim` need npm to build
- `python3` + `pip` — for Pyright and nvim-dap-python; create a dedicated venv with `debugpy`:
```bash
  python3 -m venv ~/.local/share/nvim/dap-python
  ~/.local/share/nvim/dap-python/bin/pip install debugpy
```
- `gcc`/`g++` — used by the `clangd` LSP, C++ debugging (`codelldb`), and the `<F5>` smart-run in toggleterm
- Formatters for `none-ls`: `stylua`, `prettier`, `black`, `isort`, `clang-format` (install via `:Mason` or npm/pip/cargo)
- A Nerd Font — required for icons in neo-tree, oil.nvim, fzf-lua, and lualine
The first time you open nvim, lazy.nvim will auto-install the plugins; run `:Mason` to check/install any missing LSPs.
 
### 2. Tmux
 
- Needs `xclip` **(X11)** or `wl-clipboard` **(Wayland)** for copy/paste in copy-mode
- Needs a Nerd Font for icons in the Catppuccin theme and tmux-weather
- Plugins (`vim-tmux-navigator`, `tmux-resurrect`, `catppuccin/tmux`, `tmux-cpu`, `tmux-weather`) are installed via TPM, see step 4 above

### 3. Kitty
 
- Needs a Nerd Font (config uses `JetBrainsMono Nerd` / `MesloLGS NF`) for icons to render correctly
- Kitty auto-launches `tmux` on startup (`shell tmux` in the config), so tmux + TPM need to be set up first
### 4. zsh
 
- Needs `oh-my-zsh`:
```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- Needs the `powerlevel10k` theme:
```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
- Needs the `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins:
```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Run `p10k configure` to generate `~/.p10k.zsh` (the config sources this file)
- A Nerd Font (MesloLGS NF) is needed for p10k icons to render correctly
## Note

- Default `<leader>` key is **Space**
- This setup is opinionated and tailored for a terminal-centric workflow on Arch Linux.
- Neovim keybindings (especially `<leader>` mappings) and tmux prefix shortcuts are customized — check the respective config files for details.
- If you're adding a new app, create a folder inside `~/dotfiles`, mirror the path as it would appear from `$HOME`, then `stow` it.
---
 
*Feel free to fork, adapt, and make it your own.*

