return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  init = function()
    vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      pattern = "*.md",
      callback = function(args)
        if vim.fs.root(args.buf, ".obsidian") then
          require("lazy").load({ plugins = { "obsidian.nvim" } })
        end
      end,
    })
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.md",
      callback = function(args)
        if vim.fs.root(args.buf, ".obsidian") then
          vim.opt_local.conceallevel = 2
        end
      end,
    })
  end,

  opts = {
    workspaces = {
      {
        name = "nearest",
        path = function()
          return vim.fs.root(0, ".obsidian")
        end,
      },
    },
    folder = "attachments",

    -- Make the file name be the same as the note name, otherwise you
    -- get a Zettelkasten style vault where file names are obfuscated.
    note_id_func = function(title)
      return (title and title ~= "") and title or tostring(os.time())
    end,

    legacy_commands = false,
  },
}
