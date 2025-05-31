return {
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
}
