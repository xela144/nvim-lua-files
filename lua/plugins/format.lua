return {
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require("formatter.util")

      require("formatter").setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
            function()
              if util.get_current_buffer_file_name() == "special.lua" then
                return nil
              end

              return {
                exe = "stylua",
                args = {
                  "--indent-type",
                  "Spaces",
                  "--indent-width",
                  "2",
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },
          javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettier,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier,
          },
          python = {
            require("formatter.filetypes.python").ruff,
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })

      -- vim.lsp.config("pyright", {
      --   settings = {
      --     pyright = {
      --       -- Using Ruff's import organizer
      --       disableOrganizeImports = true,
      --     },
      --     python = {
      --       analysis = {
      --         -- Ignore all files for analysis to exclusively use Ruff for linting
      --         ignore = { "*" },
      --       },
      --     },
      --   },
      -- })

      -- vim.lsp.enable("pyright")

      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup("__formatter__", { clear = true })
      autocmd("BufWritePost", {
        group = "__formatter__",
        command = ":FormatWrite",
      })
    end,
  },
}
