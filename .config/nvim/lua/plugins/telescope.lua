return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      cwd = function()
        return vim.fn.getcwd()
      end,
      path_display = { "truncate" },
      previewer = true,
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "bottom",
        width = 0.95,
      },
      sorting_strategy = "ascending",
      winblend = 0,
      file_ignore_patterns = { ".angular", ".git", "dist" },
    },
  },
  config = function()
    local builtin = require("telescope.builtin")
    local pickers_to_patch = {
      "find_files",
      "live_grep",
      "grep_string",
      "buffers",
      "oldfiles",
      "quickfix",
      "loclist",
      "diagnostics",
      "diagnostics",
      "git_files",
      "lsp_definitions",
      "lsp_references",
      "lsp_implementations",
      "lsp_type_definitions",
      "lsp_declarations",
      "lsp_incoming_calls",
      "lsp_outgoing_calls",
      "lsp_code_actions",
      "lsp_range_code_actions",
      "lsp_document_symbols",
      "lsp_workspace_symbols",
      "lsp_dynamic_workspace_symbols",
    }
    for _, picker in ipairs(pickers_to_patch) do
      local original = builtin[picker]
      builtin[picker] = function(opts)
        opts = opts or {}
        opts.cwd = vim.fn.getcwd()
        return original(opts)
      end
    end
  end,
  -- config = function(_, opts)
  --   require("telescope").setup(opts)
  --
  --   -- Set your keymap here
  --   vim.keymap.set("n", "<leader><leader>", function()
  --     require("telescope.builtin").find_files({
  --       cwd = vim.fn.getcwd(),
  --     })
  --   end, { desc = "Telescope: (Root Dir)" })
  -- end,
}
