return {
  "andythigpen/nvim-coverage",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    local coverage = require("coverage")

    vim.api.nvim_set_keymap(
      "n",
      "tcs",
      ":CoverageSummary<CR>",
      { noremap = true, silent = true, desc = "Show coverage summary" }
    )

    vim.keymap.set("n", "tcx", coverage.hide, { desc = "Hide coverage" })
    coverage.setup()

    vim.keymap.set("n", "tcc", function()
      coverage.load(true) -- Load the coverage report
      coverage.show() -- Display coverage
    end, { desc = "Show coverage lines" })
  end,
}
