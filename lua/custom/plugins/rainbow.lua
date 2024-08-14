return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    vim.g.rainbow_delimiters = {
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      priority = {
        [""] = 110,
        lua = 210,
      },
      highlight = {
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
        "RainbowDelimiterOrange",
      },
    }
  end,
}
