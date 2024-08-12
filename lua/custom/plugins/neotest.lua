return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-python")({
          dap = {
            justMyCode = false,
          },
          args = { "--cov", "--cov-report=json" },
          runner = "pytest",
        }),
      },
    })
    vim.keymap.set("n", "<leader>t", neotest.run.run)
  end,
}
