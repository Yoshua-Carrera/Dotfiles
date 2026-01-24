return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      formatters_by_ft = {
        c = { "clang-format" },
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        json = { "prettier" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        htmlangular = { "prettier" },
        go = { "gofumpt", "goimports", "golines" },
        markdown = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        python = { "ruff", "black" },
      },
    }
  end,
}
