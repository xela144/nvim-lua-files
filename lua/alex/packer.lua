
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  })
  use("nvim-neotest/nvim-nio")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate,:TSInstall python" })
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" }, -- Required
    },
  })

  -- Nvim-tree to replace NerdTree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
  })

  -- Useless plugin
  use({ "eandrju/cellular-automaton.nvim" })

  -- Debugger
  use({ "mfussenegger/nvim-dap" })
  -- Python, Go
  use({ "mfussenegger/nvim-dap-python" })
  use({ "leoluz/nvim-dap-go" })

  -- Debugger UI
  use({ "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" })

  -- Formatter
  use({ "mhartington/formatter.nvim" })

  -- Hex color preview
  use("catgoose/nvim-colorizer.lua")
end)
