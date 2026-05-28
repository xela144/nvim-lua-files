return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },

      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },

    config = function()
      local lsp = require("lsp-zero")
      vim.opt.winblend = 20
      vim.opt.winborder = "rounded"
      vim.diagnostic.config({
        float = { border = "rounded" },
        virtual_text = true,
      })
      vim.opt.signcolumn = "yes"
      require("mason").setup({})
      require("mason-lspconfig").setup({
        automatic_installation = false,
        ensure_installed = {
          "lua_ls",
          "ruff",
        },
        handlers = {
          function(server_name)
            vim.lsp.enable(server_name)
          end,
        },
      })
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("pyright")
      local lsp_defaults = require("lspconfig").util.default_config
      lsp_defaults.capabilities =
        vim.tbl_deep_extend("force", lsp_defaults.capabilities or {}, require("cmp_nvim_lsp").default_capabilities())
      local cmp = require("cmp")

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        }),
      })
      vim.cmd([[
            autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
        ]])

      vim.cmd([[
            nnoremap <silent> <leader>e :lua vim.diagnostic.setloclist()<CR>:set wrap <CR>
        ]])

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = "E",
          warn = "W",
          hint = "H",
          info = "I",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }
          -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
          end, opts)
          vim.keymap.set("n", "fm", "<cmd>LspZeroFormat<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
      })
      lsp.setup()
    end,
  },
}
