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
    -- Ignore because plugin is incorrectly typed as is nvim tradition.
    ---@diagnostic disable-next-line: missing-fields
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
    local run = function()
      -- Ignore because plugin is incorrectly typed as is nvim tradition.
      ---@diagnostic disable-next-line: missing-fields
      neotest.run.run({ strategy = "dap" })
    end
    vim.keymap.set("n", "<leader>t", run)
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "error", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "error", linehl = "", numhl = "" })
  end,
}
