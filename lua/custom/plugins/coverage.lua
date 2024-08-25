return {
  "andythigpen/nvim-coverage",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    local coverage = require("coverage")
    -- Optionally set keymaps to control coverage display
    vim.keymap.set("n", "<leader>cc", function()
      print("SHOW COVERAGE")
      coverage.load(true) -- Load the coverage report
      coverage.show() -- Display coverage
    end, { desc = "Show coverage" })

    vim.keymap.set("n", "<leader>cx", coverage.hide, { desc = "Hide coverage" })
    coverage.setup()
  end,
}
