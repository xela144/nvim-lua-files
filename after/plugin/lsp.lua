local lsp = require("lsp-zero")

lsp.preset("recommended")
require("mason").setup({
  ensure_installed = {
    "prettierd",
    "gopls",

  },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tailwindcss",
    "ts_ls",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})

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

require("lspconfig").ts_ls.setup({})
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

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>vrn", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("n", "<leader>vsh", function()
    vim.lsp.buf.signature_help()
  end, opts)
  vim.keymap.set("i", "<C-Space>", function()
    cmp.complete()
  end, opts)
end)

lsp.configure("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100,
          ignore = { "W391" },
          enabled = true,
        },
        flake8 = {
          maxLineLength = 100,
          enabled = true,
        },
      },
    },
  },
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
