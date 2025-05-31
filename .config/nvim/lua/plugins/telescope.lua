return {
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
  config = function(_, opts)
    require("telescope").setup(opts)

    -- Set your keymap here
    vim.keymap.set("n", "<leader><leader>", function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.getcwd(),
      })
    end, { desc = "Telescope: (Root Dir)" })
  end,
}
