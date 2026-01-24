# My Dotfiles

These are my personal dotfiles for my Linux setup. They are managed using `stow`.

![placeholder](https://user-images.githubusercontent.com/1234567/234567890-placeholder.png)

_(Feel free to replace the placeholder image with a screenshot of your desktop)_

## Managed Software

This repository contains configurations for the following software:

- **Window Manager:** [Hyprland](https://hyprland.org/)
- **Terminal:** [Ghostty](https://github.com/ghostty-org/ghostty), [Tmux](https://github.com/tmux/tmux)
- **Shell:** [Zsh](https://www.zsh.org/) with [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Editor:** [Neovim](https://neovim.io/) (configured with LazyVim)
- **Git:** [Lazygit](https://github.com/jesseduffield/lazygit), [Fugitive](https://github.com/tpope/vim-fugitive)
- **File Manager:** [Yazi](https://github.com/sxyazi/yazi)
- **Application Launcher:** [Wofi](https://hg.sr.ht/~scoopta/wofi)
- **And more:** VSCode, pavucontrol, etc.

## Installation

These dotfiles are managed using `stow`. To install them, clone this repository and then use `stow` to create symbolic links.

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

## Configuration Details

### Window Manager: Hyprland

The window manager is [Hyprland](https://hyprland.org/), a dynamic tiling Wayland compositor.

- **Layout:** Dwindle layout is used.
- **Terminal:** The default terminal is Ghostty.
- **Application Launcher:** Wofi is used for launching applications.

#### Keybindings

| Keybinding              | Description                       |
| ----------------------- | --------------------------------- |
| `Super + Q`             | Open terminal (Ghostty)           |
| `Super + C`             | Kill active window                |
| `Super + E`             | Open file manager (Dolphin)       |
| `Super + R`             | Open application menu (Wofi)      |
| `Super + V`             | Toggle floating mode for a window |
| `Super + P`             | Toggle pseudotiling               |
| `Super + J`             | Toggle split direction in dwindle |
| `Super + ←/↑/→/↓`       | Move focus                        |
| `Super + [1-9]`         | Switch to workspace               |
| `Super + Shift + [1-9]` | Move window to workspace          |

### Terminal: Ghostty + Tmux + Zsh

- **[Ghostty](https://github.com/ghostty-org/ghostty):** A modern, GPU-accelerated terminal emulator.
- **[Tmux](https://github.com/tmux/tmux):** A terminal multiplexer. The configuration allows for seamless navigation between Neovim and Tmux panes using `Ctrl + h/j/k/l`.
- **[Zsh](https://www.zsh.org/):** The shell, configured with the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme for a powerful and beautiful prompt.

### Editor: Neovim

The Neovim configuration is based on [LazyVim](https://www.lazyvim.org/).

- **Colorscheme:** [Catppuccin](https://github.com/catppuccin/nvim) (Frappé flavor).
- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim).

#### Key Plugins & Keybindings

| Keybinding    | Description                         | Plugin                                                                  |
| ------------- | ----------------------------------- | ----------------------------------------------------------------------- |
| `<leader>fp`  | Explore files                       | (built-in)                                                              |
| `<C-h/j/k/l>` | Navigate between Tmux panes         | [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) |
| `<leader>pp`  | Copy relative file path             | (custom)                                                                |
| `<leader>g.`  | Open Git fugitive                   | [vim-fugitive](https://github.com/tpope/vim-fugitive)                   |
| `<leader>fd`  | Find files                          | [Telescope](https://github.com/nvim-telescope/telescope.nvim)           |
| `<leader>sg`  | Search for a string in the codebase | [Telescope](https://github.com/nvim-telescope/telescope.nvim)           |
| `<leader>b`   | Manage buffers                      | [Telescope](https://github.com/nvim-telescope/telescope.nvim)           |

Other notable plugins include:

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp):** Autocompletion.
- **[conform.nvim](https://github.com/stevearc/conform.nvim):** Code formatting.
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap):** Debug Adapter Protocol support.
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim):** A better diff tool.
- **[noice.nvim](https://github.com/folke/noice.nvim):** A prettier UI for messages and commands.
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua):** A file explorer.

## Neovim Configuration

The Neovim configuration is located in `.config/nvim/`. It is a personalized setup based on [LazyVim](https://github.com/LazyVim/LazyVim). For more details, see the `README.md` file in the `.config/nvim/` directory.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
