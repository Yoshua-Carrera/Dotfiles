# 💤 LazyVim

This is my personal flavor of [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## LSP Configuration (Manual)

This Neovim configuration has been set up to use a manual LSP configuration, moving away from `mason.nvim`.
Details on the setup process for individual language servers (including Docker, Go, TypeScript, and more), formatters, and linters can be found in [mason-migration.md](mason-migration.md).

The core LSP configuration is handled in `lua/plugins/lsp.lua`.

## Configuration Details

This section provides a recap of the customizations made in the `lua/config/` and `lua/plugins/` directories.

### Core Configuration (`lua/config/`)

-   **Plugin Management (`lazy.lua`):** Uses `lazy.nvim` to manage plugins. The configuration is set to load custom plugins eagerly (`lazy = false`) and includes extras for testing and DAP. The default colorscheme is set to `catppuccin`.
-   **Keymaps (`keymaps.lua`):**
    -   `<leader>fp`: Open file explorer.
    -   `<C-h/j/k/l>`: Navigate between Tmux panes.
    -   `<leader>pp`: Copy the relative path of the current file.
    -   `<leader>g.`: Open Fugitive in a new tab.
-   **Autocmds (`autocmds.lua`):**
    -   Custom notification and keymap for handling Git conflicts.
    -   Sets `pumblend = 0` on colorscheme change for solid pop-up menus.

### Plugins & Customizations (`lua/plugins/`)

This setup is highly customized. Notably, **`mason.nvim`** and the default file explorer **`neo-tree.nvim`** are disabled in favor of a manual LSP setup and an alternative explorer.

#### Appearance & UI

-   **`catppuccin.nvim`**: The primary colorscheme, configured with a transparent background for a modern, floating look.
-   **`bufferline.nvim`**: Provides customized editor tabs with an underline indicator for the active buffer.
-   **`noice.nvim`**: Overhauls the Neovim UI for commands, messages, and search to be more modern and less intrusive.
-   **`smear-cursor.nvim`**: Adds a smooth, animated "smear" effect to cursor movement.

#### Git Integration

-   **`gitsigns.nvim`**: Provides Git decorations in the sign column and includes `current_line_blame` for inline author information.
-   **`git-conflict.nvim`**: Simplifies resolving merge conflicts with dedicated keymaps under `<leader>c`.
-   **`vim-fugitive`**: A classic and powerful Git wrapper.
-   **`diffview.nvim`**: Used for viewing Git diffs.

#### Development & LSP

-   **`nvim-lspconfig`**: Manages the manual setup of Language Servers. Configured for: `TypeScript/JS`, `Angular`, `Lua`, `Go`, `Bash`, `Python`, `CSS`, `HTML`, `JSON`, `Docker`, and `Marksman` (Markdown).
-   **`conform.nvim`**: Handles code formatting for a wide variety of languages, including `prettier` for web development, `gofumpt`/`goimports` for Go, and `ruff`/`black` for Python.
-   **`nvim-cmp`**: Powers autocompletion, configured with sources from the LSP.
-   **`nvim-dap`**: Provides debugging capabilities, with a specific setup for Go (`nvim-dap-go`).

#### Utility & Tools

-   **`telescope.nvim`**: The primary fuzzy finder, customized with a vertical layout, bottom prompt, and project-wide search commands (`<leader><leader>` for files, `<leader>sg` for live grep).
-   **`lazydocker.nvim`**: Allows for managing Docker containers from a floating window, accessible via `<leader>ld`.
-   **`vim-tmux-navigator`**: Enables seamless pane navigation between Neovim and Tmux using Ctrl + movement keys.
-   **`markdown-preview.nvim`**: Provides a live preview for Markdown files in the browser.

#### Testing

-   **`neotest`**: The main test runner, configured with the `neotest-vitest` adapter to run Vitest tests directly within the editor.