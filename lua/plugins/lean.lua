return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },

  dependencies = {
    -- optional dependencies:

    -- 'nvim-telescope/telescope.nvim', -- for Lean-specific pickers
    -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
    -- 'andrewradev/switch.vim',        -- for switch support
    -- 'tomtom/tcomment_vim',           -- for commenting
  },

  ---@type lean.Config
  opts = {
    mappings = true,
    infoview = {
      orientation = "vertical",
      width = 50,
    },
  },
}
