return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },

  dependencies = {},

  init = function()
    vim.g.lean_config = {
      mappings = true,
      infoview = {
        orientation = "vertical",
        width = 50,
      },
    }
  end,
}
