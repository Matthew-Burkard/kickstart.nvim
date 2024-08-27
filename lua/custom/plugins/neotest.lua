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
          -- ,
        }),
      },
    })
    local debug = function()
      -- Ignore because plugin is incorrectly typed as is nvim tradition.
      ---@diagnostic disable-next-line: missing-fields
      neotest.run.run({ strategy = "dap" })
    end
    local run = function()
      -- Ignore because plugin is incorrectly typed as is nvim tradition.
      ---@diagnostic disable-next-line: missing-fields
      neotest.run.run({ extra_args = { "--cov", "--cov-report=json" } })
    end
    vim.keymap.set("n", "<leader>td", debug)
    vim.keymap.set("n", "<leader>tr", run)
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "error", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "error", linehl = "", numhl = "" })
  end,
}
