local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

local recording_mode = { "recording", fmt = show_macro_recording }

-- Function to get active LSP clients
local function lsp_status()
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    return "[No LSP]"
  end

  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end
  return "[" .. table.concat(client_names, ", ") .. "]"
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode", recording_mode },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "diagnostics" },
        lualine_x = { lsp_status },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      options = {
        globalstatus = true,
      },
    })
  end,
}
