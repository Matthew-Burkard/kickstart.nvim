local git = {
  FileDeleted = "",
  FileIgnored = "◌",
  FileRenamed = "",
  FileStaged = "S",
  FileUnmerged = "",
  FileUnstaged = "",
  FileUntracked = "U",
}

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = git.FileUnstaged,
              staged = git.FileStaged,
              unmerged = git.FileUnmerged,
              renamed = git.FileRenamed,
              untracked = git.FileUntracked,
              deleted = git.FileDeleted,
              ignored = git.FileIgnored,
            },
          },
        },
      },
    })
    local api = require("nvim-tree.api")
    vim.keymap.set("n", "\\", api.tree.open, { desc = "Open explorer" })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>e",
      ":NvimTreeFindFile<CR>",
      { noremap = true, silent = true, desc = "Open file explorer and find file" }
    )

    -- Set buffer-specific keymaps for Nvim Tree.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        local opts = { buffer = 0, noremap = true, silent = true }
        vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
        vim.keymap.set("n", "l", api.node.open.edit, opts)
        vim.keymap.set("n", "h", api.node.open.edit, opts)
      end,
    })
  end,
}
