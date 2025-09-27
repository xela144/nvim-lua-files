return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local nvimtree = require("nvim-tree")

      local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.del("n", "s", { buffer = bufnr })
        vim.keymap.del("n", "<C-E>", { buffer = bufnr })
      end

      nvimtree.setup({
        on_attach = my_on_attach,
        renderer = {
          icons = {
            show = {
              git = true,
              file = false,
              folder = false,
              folder_arrow = true,
            },
            glyphs = {
              folder = {
                arrow_closed = "⏵",
                arrow_open = "⏷",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "⌥",
                renamed = "➜",
                untracked = "★",
                deleted = "⊖",
                ignored = "◌",
              },
            },
          },
        },
      })

      vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
    end,
  },
}
