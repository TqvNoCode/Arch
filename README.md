<h1 align="center"> 🗂️ My Dotfiles Configuration </h1>

> Personal development environment for **Arch Linux** — managed with GNU Stow and centered around terminal-based, keyboard-driven tools.

---

## ⚡ Core Tools

| Role | Tool |
|------|------|
| Terminal | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| Editor | [Neovim](https://neovim.io/) |
| Multiplexer | [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm) |
| Shell | [Zsh](https://www.zsh.org/) |
| Config Manager | [GNU Stow](https://www.gnu.org/software/stow/) |

---

## 📁 Directory Structure

```
~/dotfiles/
├── nvim/
│   └── nvim/          # Neovim (.config/nvim)
├── tmux/
│   └── .tmux/         # tmux (.tmux.conf)
├── .gitignore
└── README.md
```

---

## 🚀 Installation

### 1. Install Required Packages

Make sure your Arch Linux system has the core tools installed:

```bash
sudo pacman -S git stow neovim tmux kitty zsh
```

---

### 2. Set Up SSH Key *(for new machines / VMs)*

If you're on a fresh environment and haven't connected to GitHub via SSH yet, do this first:

**Create a new SSH key:**

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
```

Copy the output and add it to your GitHub account under **Settings → SSH Keys**.

**Verify the connection:**

```bash
ssh -T git@github.com
```

You should see: `Hi <username>! You've successfully authenticated...`

---

### 3. Clone the Repository

Clone this repo into your Home directory:

```bash
git clone git@github.com:YourUsername/Arch.git ~/dotfiles
cd ~/dotfiles
```

---

### 4. Deploy with GNU Stow

Use `stow` to create symlinks from `dotfiles/` into your `$HOME`. Since symlinks are grouped by package, you can stow each one individually:

```bash
# Link all packages at once
stow -v -d dotfiles nvim
stow -v -d dotfiles tmux
stow -v -d dotfiles kitty
```

Or from inside the `~/dotfiles` directory:

```bash
stow */
```

> **Tip:** Use `stow -D <package>` to remove symlinks, and `stow -R <package>` to restow (remove + re-link).

---

## 🔌 Additional Configuration

### Tmux Plugin Manager (TPM)

This config uses [TPM](https://github.com/tmux-plugins/tpm) to manage Tmux plugins.

**1. Clone TPM:**

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**2. Install plugins:**

Start a tmux session, then press `Prefix + I` (capital i) to fetch and install all plugins defined in `.tmux.conf`.

---

## 📝 Notes

- This setup is opinionated and tailored for a **terminal-centric** workflow on Arch Linux.
- Neovim keybindings (especially `<leader>` mappings) and tmux prefix shortcuts are customized — check the respective config files for details.
- If you're adding a new app, create a folder for it inside `~/dotfiles/`, mirror the path structure as it would appear from `$HOME`, then `stow` it.

---

*Feel free to fork, adapt, and make it your own.*
*Inspired by [kunkka's dotfiles](https://github.com/kunkka19xx/nix)*
