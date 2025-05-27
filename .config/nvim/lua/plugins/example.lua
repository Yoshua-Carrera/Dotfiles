if true then
  return {
    { "nvim-neotest/nvim-nio" },
    {
      "nvim-neotest/neotest",
      dependencies = {
        "marilari88/neotest-vitest",
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
      },
      opts = function(_, opts)
        table.insert(opts.adapters, require("neotest-vitest"))
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      config = function()
        require("gitsigns").setup({
          current_line_blame = true,
        })
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      commit = "af78ba3b7da51ea5780bdb2c4b990ae2ea2ce716",
      opts = {
        defaults = {
          path_display = { "truncate" },
          previewer = true,
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "bottom",
            width = 0.95,
          },
          sorting_strategy = "ascending",
          winblend = 0,
          file_ignore_patterns = { "node_modules", ".angular", ".git", "dist" },
        },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      enabled = false,
    },
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        colorscheme = "catppuccin-frappe",
        term_colors = true,
        priority = 1000,
        transparent_background = true,
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.25, -- percentage of the shade to apply to the inactive window
        },
      },
      config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-macchiato")
        vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight Pmenu guibg=NONE ctermbg=NONE
      highlight PmenuSel guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
    ]])
      end,
    },
    {
      "stevearc/conform.nvim",
      opts = function()
        return {
          formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            json = { "prettier" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            html = { "prettier" },
            go = { "gofumpt" },
            markdown = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
          },
        }
      end,
    },
  }
end
