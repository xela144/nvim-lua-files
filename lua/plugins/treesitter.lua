return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "python", "c", "lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "markdown" },
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/playground",
}
