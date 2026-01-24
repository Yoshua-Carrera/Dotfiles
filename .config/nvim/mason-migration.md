# Mason Migration Guide

This document outlines the steps taken to migrate from `mason.nvim` to a manual setup for managing LSP servers, formatters, and other tools in your Neovim configuration.

## General Approach

The core idea is to replace `mason.nvim` with direct installation of tools using language-specific package managers (like `npm` or `go install`) or building from source. `nvim-lspconfig` is then used to configure Neovim to use these manually installed tools.

## Centralized LSP Configuration

A new file, `lua/plugins/lsp.lua`, was created to centralize all LSP configurations. This file defines the `on_attach` function for LSP keybindings and configures each language server.

```lua
-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts)
    end

    -- TypeScript
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Angular
    lspconfig.angularls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          tsdk = "/home/algorithmic/.nvm/versions/node/v20.19.1/lib/node_modules/typescript",
        },
      },
    })

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })

    -- Go
    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })

    -- Bash
    lspconfig.bashls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
```

## Language-Specific Setup

### TypeScript

1.  **Installation:** The following tools were installed globally using `npm`:
    ```bash
    npm install -g typescript-language-server typescript prettier
    ```

2.  **LSP Configuration:** `tsserver` was configured in `lua/plugins/lsp.lua`.

3.  **Formatter:** `conform.nvim` was already configured to use `prettier` for TypeScript files.

### Angular

1.  **Installation:** The Angular Language Server was installed globally using `npm`:
    ```bash
    npm install -g @angular/language-server
    ```

2.  **LSP Configuration:** `angularls` was configured in `lua/plugins/lsp.lua`, with an explicit `tsdk` path to the global TypeScript installation to resolve dependency issues.

### Lua

1.  **Installation:** `lua-language-server` was built from source. This requires `ninja` to be installed on your system.
    -   **Dependency:** Install `ninja` (e.g., `sudo apt-get install ninja-build`).
    -   **Build:** The server was cloned and built. The executable, along with its associated `main.lua` and other runtime files, should be placed in a directory that is added to your system's `PATH` environment variable. A recommended approach is to install it via a package manager like `brew` (macOS/Linux) or `cargo` if available.

2.  **LSP Configuration:** `lua_ls` was configured in `lua/plugins/lsp.lua` with specific settings for Neovim (e.g., `LuaJIT` version, `vim` globals, runtime library awareness).

### Go

1.  **Installation:** The following tools were installed using `go install`:
    ```bash
    go install golang.org/x/tools/gopls@latest
    go install mvdan.cc/gofumpt@latest
    go install golang.org/x/tools/cmd/goimports@latest
    go install github.com/segmentio/golines@latest
    ```

2.  **LSP Configuration:** `gopls` was configured in `lua/plugins/lsp.lua` with settings for completion and analysis.

3.  **Formatter:** `conform.nvim` was configured to use `gofumpt`, `goimports`, and `golines` for Go files.

### Bash

1.  **Installation:**
    -   `bash-language-server` was installed globally using `npm`:
        ```bash
        npm install -g bash-language-server
        ```
    -   `shfmt` was installed using `go install`:
        ```bash
        go install mvdan.cc/sh/v3/cmd/shfmt@latest
        ```

2.  **LSP Configuration:** `bashls` was configured in `lua/plugins/lsp.lua`.

3.  **Formatter:** `conform.nvim` was already configured to use `shfmt` for shell script files.

### Docker

1.  **Installation:**
    -   `dockerfile-language-server` was installed globally using `npm`:
        ```bash
        npm install -g dockerfile-language-server
        ```

2.  **LSP Configuration:**
    -   `dockerls` was configured in `lua/plugins/lsp.lua`.
    -   A common issue was fixed where the server was incorrectly named `dockerfilels` instead of `dockerls`, which is the name expected by `nvim-lspconfig`.
